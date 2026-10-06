CREATE TABLE IF NOT EXISTS schools(id text PRIMARY KEY,name text NOT NULL);
CREATE TABLE IF NOT EXISTS profiles(id text PRIMARY KEY,school_id text NOT NULL REFERENCES schools,name text NOT NULL,role text NOT NULL CHECK(role IN ('teacher','student')),UNIQUE(school_id,id));
CREATE TABLE IF NOT EXISTS students(profile_id text PRIMARY KEY REFERENCES profiles,level int NOT NULL CHECK(level BETWEEN 0 AND 5),height_cm int NOT NULL CHECK(height_cm BETWEEN 70 AND 230),weight_kg int NOT NULL CHECK(weight_kg BETWEEN 10 AND 150),history_state text NOT NULL CHECK(history_state IN ('known','new','missing')));
CREATE TABLE IF NOT EXISTS needs(code text PRIMARY KEY,label text NOT NULL);
CREATE TABLE IF NOT EXISTS student_needs(student_id text REFERENCES students,need_code text REFERENCES needs,PRIMARY KEY(student_id,need_code));
CREATE TABLE IF NOT EXISTS horses(id text PRIMARY KEY,school_id text NOT NULL REFERENCES schools,name text NOT NULL,kind text,height_cm int,temperament text,description text,status text NOT NULL,availability_reason text,max_daily_lessons int NOT NULL DEFAULT 3 CHECK(max_daily_lessons BETWEEN 1 AND 3),rest_day int NOT NULL CHECK(rest_day BETWEEN 0 AND 6),min_rider_level int NOT NULL DEFAULT 0,max_rider_weight_kg int NOT NULL DEFAULT 80,max_weekly_jumps int NOT NULL DEFAULT 1 CHECK(max_weekly_jumps BETWEEN 0 AND 1),source text,synthetic_fields jsonb NOT NULL DEFAULT '[]',UNIQUE(school_id,id));
CREATE TABLE IF NOT EXISTS horse_needs(horse_id text REFERENCES horses,need_code text REFERENCES needs,PRIMARY KEY(horse_id,need_code));
CREATE TABLE IF NOT EXISTS horse_activities(horse_id text REFERENCES horses,activity text NOT NULL,PRIMARY KEY(horse_id,activity));
CREATE TABLE IF NOT EXISTS groups(id text PRIMARY KEY,school_id text REFERENCES schools,teacher_id text NOT NULL,name text NOT NULL,level int NOT NULL,day_label text NOT NULL,time text NOT NULL,activity text NOT NULL,duration_minutes int NOT NULL DEFAULT 45 CHECK(duration_minutes BETWEEN 15 AND 180),FOREIGN KEY(school_id,teacher_id) REFERENCES profiles(school_id,id));
CREATE TABLE IF NOT EXISTS memberships(group_id text REFERENCES groups,student_id text REFERENCES students,PRIMARY KEY(group_id,student_id));
CREATE TABLE IF NOT EXISTS lessons(id text PRIMARY KEY,group_id text REFERENCES groups,lesson_date date NOT NULL);
CREATE TABLE IF NOT EXISTS wishes(student_id text REFERENCES students,group_id text REFERENCES groups,month text NOT NULL,horse_id text REFERENCES horses,PRIMARY KEY(student_id,group_id,month,horse_id));
CREATE TABLE IF NOT EXISTS month_history(student_id text REFERENCES students,group_id text REFERENCES groups,month text NOT NULL,horse_id text REFERENCES horses,received boolean NOT NULL DEFAULT false,PRIMARY KEY(student_id,group_id,month,horse_id));
CREATE TABLE IF NOT EXISTS distributions(group_id text PRIMARY KEY REFERENCES groups,revision int NOT NULL DEFAULT 0,status text NOT NULL DEFAULT 'draft');
CREATE TABLE IF NOT EXISTS assignments(lesson_id text REFERENCES lessons,student_id text REFERENCES students,horse_id text REFERENCES horses,reason text NOT NULL,PRIMARY KEY(lesson_id,student_id),UNIQUE(lesson_id,horse_id));
CREATE TABLE IF NOT EXISTS decisions(group_id text REFERENCES groups,horse_id text REFERENCES horses,student_id text REFERENCES students,reason text NOT NULL,PRIMARY KEY(group_id,horse_id));
CREATE TABLE IF NOT EXISTS audit(id bigserial PRIMARY KEY,school_id text REFERENCES schools,actor_id text REFERENCES profiles,action text NOT NULL,detail text NOT NULL,created_at timestamptz NOT NULL DEFAULT now());
CREATE TABLE IF NOT EXISTS sessions(token text PRIMARY KEY,profile_id text REFERENCES profiles,expires_at timestamptz NOT NULL);

CREATE TABLE IF NOT EXISTS distribution_versions(id bigserial PRIMARY KEY,group_id text REFERENCES groups,actor_id text REFERENCES profiles,action text NOT NULL,before_state jsonb NOT NULL,after_state jsonb NOT NULL,created_at timestamptz NOT NULL DEFAULT now());
CREATE TABLE IF NOT EXISTS approval_operations(school_id text REFERENCES schools,operation_id text NOT NULL,group_id text REFERENCES groups,fingerprint text NOT NULL,result jsonb NOT NULL,PRIMARY KEY(school_id,operation_id));

-- Tenant checks keep relation rows normalized without duplicating school_id.
CREATE OR REPLACE FUNCTION enforce_group_student_school() RETURNS trigger LANGUAGE plpgsql AS $$
DECLARE group_school text; pupil_school text; horse_school text;
BEGIN
 SELECT school_id INTO group_school FROM groups WHERE id=NEW.group_id;
 SELECT school_id INTO pupil_school FROM profiles WHERE id=NEW.student_id AND role='student';
 IF group_school IS NULL OR pupil_school IS DISTINCT FROM group_school THEN RAISE EXCEPTION 'Student/group school mismatch'; END IF;
 IF TG_TABLE_NAME IN ('wishes','month_history','decisions') THEN
   SELECT school_id INTO horse_school FROM horses WHERE id=NEW.horse_id;
   IF horse_school IS DISTINCT FROM group_school THEN RAISE EXCEPTION 'Horse/group school mismatch'; END IF;
   IF NOT EXISTS(SELECT 1 FROM memberships WHERE group_id=NEW.group_id AND student_id=NEW.student_id) THEN RAISE EXCEPTION 'Student is not a group member'; END IF;
 END IF;
 RETURN NEW;
END $$;
CREATE OR REPLACE TRIGGER memberships_tenant BEFORE INSERT OR UPDATE ON memberships FOR EACH ROW EXECUTE FUNCTION enforce_group_student_school();
CREATE OR REPLACE TRIGGER wishes_tenant BEFORE INSERT OR UPDATE ON wishes FOR EACH ROW EXECUTE FUNCTION enforce_group_student_school();
CREATE OR REPLACE TRIGGER month_history_tenant BEFORE INSERT OR UPDATE ON month_history FOR EACH ROW EXECUTE FUNCTION enforce_group_student_school();
CREATE OR REPLACE TRIGGER decisions_tenant BEFORE INSERT OR UPDATE ON decisions FOR EACH ROW EXECUTE FUNCTION enforce_group_student_school();
CREATE OR REPLACE FUNCTION enforce_assignment_school() RETURNS trigger LANGUAGE plpgsql AS $$
DECLARE gid text; school text;
BEGIN
 SELECT l.group_id,g.school_id INTO gid,school FROM lessons l JOIN groups g ON g.id=l.group_id WHERE l.id=NEW.lesson_id;
 IF NOT EXISTS(SELECT 1 FROM memberships m JOIN profiles p ON p.id=m.student_id WHERE m.group_id=gid AND m.student_id=NEW.student_id AND p.school_id=school) OR NOT EXISTS(SELECT 1 FROM horses WHERE id=NEW.horse_id AND school_id=school) THEN RAISE EXCEPTION 'Assignment school/membership mismatch'; END IF;
 RETURN NEW;
END $$;
CREATE OR REPLACE TRIGGER assignments_tenant BEFORE INSERT OR UPDATE ON assignments FOR EACH ROW EXECUTE FUNCTION enforce_assignment_school();

-- Pictures remain school-owned horse properties; originals can replace mockups.
ALTER TABLE horses ADD COLUMN IF NOT EXISTS image_path text;
ALTER TABLE horses ADD COLUMN IF NOT EXISTS image_kind text CHECK(image_kind IN ('mockup','photo'));
