const mysql = require('mysql2');
const dotenv = require('dotenv')


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

async function getUserByEmail(email) {
    const [user] = await pool.query(`
        SELECT * FROM USER
        WHERE USER_EMAIL = '${email}';
    `);
    return user;
}

// Load Trainer data with user data nested in, will always want user info with trainer
async function getTrainerByEmail(email) {
    const [trainer] = await pool.query(`
        SELECT * FROM CANTRAINDB.TRAINER t
        INNER JOIN CANTRAINDB.USER u u.USER_ID = t.USER_ID
        WHERE u.USER_EMAIL;
    `);
    return trainer;
}

async function getTrainerById(id) {
    
}

// Load the Client info with the user data nested in, will always want the user data with client
async function getClientByEmail(email) {

}

async function getClientListByTrainer(trainerId) {

}

async function getAssignedRegimentsByClient(clientId) {

}

module.exports = {
    getUserByEmail,
    getTrainerByEmail
}

