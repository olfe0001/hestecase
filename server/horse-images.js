import {query} from './db.js';
export async function seedHorseImages(){
  // Never replace a school's own picture. These three shared mockups illustrate
  // the prototype; coat colour is not inferred as a real case characteristic.
  await query(`UPDATE horses SET image_path=CASE
      WHEN height_cm<=130 THEN '/images/horses/chestnut-pony.jpg'
      WHEN length(id)%2=0 THEN '/images/horses/grey.jpg'
      ELSE '/images/horses/bay.jpg' END,image_kind='mockup'
    WHERE image_path IS NULL AND school_id IN ('demo','enghoj')`);
}
