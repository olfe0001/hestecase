// Integration smoke against the running mockup, not unit tests.
import assert from 'node:assert/strict';
const base=process.env.BASE_URL||'http://localhost:3005';
let cookie='';
async function request(path,method='GET',body,expected=200){const response=await fetch(base+'/api'+path,{method,headers:{cookie,...(body?{'content-type':'application/json'}:{})},body:body?JSON.stringify(body):undefined});const result=await response.json();assert.equal(response.status,expected,JSON.stringify(result));const setCookie=response.headers.get('set-cookie');if(setCookie)cookie=setCookie.split(';')[0];return result;}
await request('/session','POST',{profileId:'student-alma'});
const original=await request('/dashboard');const originalCodes=original.students[0].needs.map(n=>n.code);const group=original.groups[0];
try{
 const changed=[...new Set([...originalCodes,'balance'])];
 await request('/profile/needs','PUT',{needCodes:changed});
 let current=await request('/dashboard');assert.ok(current.students[0].needs.some(n=>n.code==='balance'));assert.equal(current.groups.find(g=>g.id===group.id).status,'draft');
 await request('/profile/needs','PUT',{needCodes:['fake-need']},422);
 await request('/profile/needs','PUT',{needCodes:['calm','calm']},422);
 await request('/profile/needs','PUT',{needCodes:[],studentId:'student-noah'},422);
 await request('/session','POST',{profileId:'teacher-anne'});current=await request('/dashboard');assert.ok(current.students.find(s=>s.id==='student-alma').needs.some(n=>n.code==='balance'));
 await request('/profile/needs','PUT',{needCodes:[]},403);
 assert.ok(current.history.some(e=>e.action==='Elevhensyn opdateret'));
 await request('/session','POST',{profileId:'student-alma'});
 await request('/profile/needs','PUT',{needCodes:[]});assert.equal((await request('/dashboard')).students[0].needs.length,0);
}finally{await request('/session','POST',{profileId:'student-alma'});await request('/profile/needs','PUT',{needCodes:originalCodes});}
console.log('PASS: egne hensyn kan tilføjes og fjernes, læreren ser dem, fordeling bliver kladde, historik gemmes, ugyldige valg og ændring af andre profiler afvises.');
