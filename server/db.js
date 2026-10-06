import pg from 'pg';
import {readFile} from 'node:fs/promises';
export const pool = new pg.Pool({connectionString:process.env.DATABASE_URL || 'postgres://stald:stald_demo@localhost:5434/stald'});
export const query=(sql,args=[])=>pool.query(sql,args);
export async function initialize(){await query(await readFile(new URL('./db/schema.sql',import.meta.url),'utf8'));}
export async function transaction(fn){const db=await pool.connect();try{await db.query('BEGIN');const result=await fn(db);await db.query('COMMIT');return result;}catch(e){await db.query('ROLLBACK');throw e;}finally{db.release();}}
