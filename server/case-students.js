import {readFile} from 'node:fs/promises';
import {transaction} from './db.js';

// One-time, transactional case import. Keep existing IDs and demo history intact.
export async function importCaseStudents(){
  const data=JSON.parse(await readFile(new URL('../data/students.json',import.meta.url),'utf8'));
  await transaction(async db=>{
    await db.query('SELECT pg_advisory_xact_lock(19062026)');
    if(!(await db.query("SELECT id FROM schools WHERE id='demo'")).rowCount)return;
    if((await db.query("SELECT id FROM audit WHERE school_id='demo' AND action='Caseelever indlæst v1'")).rowCount)return;
    for(const group of data.groups){
      await db.query(`INSERT INTO groups(id,school_id,teacher_id,name,level,day_label,time,activity)
        VALUES($1,'demo','teacher-anne',$2,$3,'Fredag',$4,'dressage')
        ON CONFLICT(id) DO UPDATE SET name=EXCLUDED.name,level=EXCLUDED.level,day_label=EXCLUDED.day_label,time=EXCLUDED.time`,[group.id,group.name,group.level,group.time]);
      await db.query(`INSERT INTO lessons VALUES($1,$2,'2026-10-09') ON CONFLICT(id) DO UPDATE SET lesson_date=EXCLUDED.lesson_date`,['lesson-'+group.id,group.id]);
      await db.query('INSERT INTO distributions(group_id) VALUES($1) ON CONFLICT DO NOTHING',[group.id]);
      for(const student of group.students){
        await db.query(`INSERT INTO profiles VALUES($1,'demo',$2,'student') ON CONFLICT(id) DO UPDATE SET name=EXCLUDED.name`,[student.id,student.name]);
        // Numeric body measurements are illustrative, never inferred from names.
        await db.query(`INSERT INTO students VALUES($1,$2,140,40,'missing') ON CONFLICT DO NOTHING`,[student.id,group.level]);
        await db.query('INSERT INTO memberships VALUES($1,$2) ON CONFLICT DO NOTHING',[group.id,student.id]);
      }
    }
    await db.query("UPDATE groups SET name='Demo · torsdag · spring' WHERE id='group-jumping'");
    // Added members and changed lesson times require another teacher approval.
    await db.query("UPDATE distributions SET status='draft',revision=revision+1 WHERE group_id IN(SELECT id FROM groups WHERE school_id='demo')");
    await db.query(`INSERT INTO audit(school_id,actor_id,action,detail) VALUES('demo','teacher-anne','Caseelever indlæst v1',$1)`,['34 elevnavne og fire fredagshold fra '+data.source+'. Kropsmål, individuelle niveauer, behov, ønsker og ventetidshistorik er fortsat demonstrationsdata.']);
  });
}
