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
async function getTrainerById(id) {
    const [trainer] = await pool.query(`
        SELECT * FROM CANTRAINDB.TRAINER t
        INNER JOIN CANTRAINDB.USER u
        ON u.USER_ID = t.USER_ID
        WHERE t.TRAINER_ID = ${id};
    `);
    return trainer;
}

// Load the Client info with the user data nested in, will always want the user data with client
async function getClientByUserId(id) {
    const [client] = await pool.query(`
        SELECT * FROM CANTRAINDB.CLIENT c
        INNER JOIN CANTRAINDB.USER u
        ON c.USER_ID = u.USER_ID
        WHERE c.USER_ID = ${id};
    `);
    return client;
}

async function getClientListByTrainer(trainerId) {

}

async function getClientListByUser(trainerId) {

}

async function getAssignedRegimentListByClient(clientId) {
    const [regimentList] = await pool.query(`
        SELECT * FROM CANTRAINDB.ASSIGNED_REGIMENT ar
        INNER JOIN CANTRAINDB.REGIMENT r 
        ON ar.REGIMENT_ID = r.REGIMENT_ID
        WHERE ar.CLIENT_ID = ${clientId};
    `);
    return regimentList;
}

async function getAssignedRegimentListByUser(userId) {
    const [regimentList] = await pool.query(`
        SELECT * FROM CANTRAINDB.ASSIGNED_REGIMENT ar
        INNER JOIN CANTRAINDB.REGIMENT r 
        ON ar.REGIMENT_ID = r.REGIMENT_ID
        INNER JOIN CANTRAINDB.TRAINER t 
        ON r.TRAINER_ID = t.TRAINER_ID
        INNER JOIN CANTRAINDB.USER u 
        ON t.USER_ID = u.USER_ID
        WHERE ar.CLIENT_ID = (SELECT CLIENT_ID FROM CANTRAINDB.CLIENT c
            WHERE c.USER_ID = ${userId});
    `);
    return regimentList;
}

async function getClientListByTrainer(trainerId) {
    const [clientList] = await pool.query(`
        SELECT * FROM CANTRAINDB.CLIENT c
        INNER JOIN CANTRAINDB.USER u
        ON u.USER_ID = c.USER_ID
        WHERE TRAINER_ID = ${trainerId};
    `);
    return clientList;
}

async function getClientListByUser(userId) {
    const [clientList] = await pool.query(`
        SELECT * FROM CANTRAINDB.CLIENT c
        INNER JOIN CANTRAINDB.USER u
        ON u.USER_ID = c.USER_ID
        WHERE TRAINER_ID = (SELECT TRAINER_ID FROM CORE.TRAINER t
            WHERE t.USER_ID = ${userId});
    `);
    return clientList;
}

// Load the next workout for a user to complete for a regiment
async function getNextAssignedWorkoutOfAssignedRegiment(assignedRegimentId) {
    return null;
}

/**
 * Load a list of assigned workouts for an assigned regiment
 * @param {int} assignedRegimentId 
 * @returns 
 */
async function getAssignedWorkoutListByAssignedRegiment(assignedRegimentId) {
    const [assignedWorkoutList] = await pool.query(`
        SELECT * FROM CANTRAINDB.ASSIGNED_WORKOUT aw
        INNER JOIN CANTRAINDB.WORKOUT w
        ON w.WORKOUT_ID = aw.WORKOUT_ID
        WHERE aw.REGIMENT_ID = ${assignedRegimentId};
        `);
    return assignedWorkoutList;
}

module.exports = {
    getUserByEmail,
    getTrainerById,
    getClientByUserId,
    getAssignedRegimentListByClient,
    getAssignedRegimentListByUser,
    getAssignedWorkoutListByAssignedRegiment,
}
