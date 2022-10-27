import mysql from 'mysql2';

const pool = mysql.createPool({
    host: 'cantrain-db-2.cfnemm1rnekh.us-east-1.rds.amazonaws.com',
    port: '3306',
    user: 'admin',
    password: '', // DO NOT SAVE THIS IN VERSION CONTROL
    database: 'CANTRAINDB'
}).promise();

const result = await pool.query("SELECT * FROM USER");
const rows = result[0]

console.log(rows);
console.log("Flag 2");
