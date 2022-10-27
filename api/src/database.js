import mysql from 'mysql2';
import dotenv from 'dotenv';

// Load the MySQL creds from .env
dotenv.config();

const host = process.env.MYSQL_HOST;
const port = process.env.MYSQL_PORT;
const user = process.env.MYSQL_USER;
const password = process.env.MYSQL_PASSWORD;
const db = process.env.MYSQL_DATABASE;

const pool = mysql.createPool({
    host: host,
    port: port,
    user: user,
    password: password,
    database: db
}).promise();

const result = await pool.query("SELECT * FROM USER");
const rows = result[0]

console.log(rows);
console.log("Flag 2");
