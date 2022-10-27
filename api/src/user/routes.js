const express = require('express');

// Set up the DB connection
const mysql = require('mysql');
const { createBrotliCompress } = require('zlib');

const db = mysql.createConnection({
    host: 'cantrain-db-2.cfnemm1rnekh.us-east-1.rds.amazonaws.com',
    port: '3306',
    user: 'admin',
    password: 'EpicPassword97', // DO NOT SAVE THIS IN VERSION CONTROL
    database: 'CANTRAINDB'
});

module.exports = db;

const routes = express.Router({
    mergeParams: true
});

// Req (request) is what is coming in from the API, res (response) is what we are sending back
routes.get('/', (req, res) => {
    // For now just send an empty object and 200
    res.status(200).json({'message' : 'Hello Dan!'});
});

routes.get('/findByEmail/:email', (req, res) => {
    db.connect(err=>{
        if (err) {
            console.log(err.message);
            return 
        }
        
        console.log('Database connected'); 
    });

    const email = req.params.email;
    // Need to validate email
    const query = 'SELECT * FROM `USER` WHERE `USER_EMAIL` = ' + email + '';
    var json = null;

    db.query(query, function (error, results, fields) {
        console.log('Flag 1 ' + query)
        console.log(error);
        console.log(results);
        console.log('Flag 2')
        
        if (results.length > 0) {
            json = results
        } else {
            json = {'userId' : -1, 'message' : 'userNotFound'}
        }

       
    });
    
    /*
    if (email == 'danmopsick@gmail.com') {
        json = {
            'userId' : 1,
            'email'  : 'danmopsick@gmail.com'
        }
    } else {
        json = {
            'email' : 'NOT DAN'
        }
    } */
    db.end();

    res.status(200).json(json);
});

module.exports = {
    routes,
}
