const express = require('express');

const {
    getUserByEmail : getUserByEmail
} = require('../database');


const routes = express.Router({
    mergeParams: true
});

// Req (request) is what is coming in from the API, res (response) is what we are sending back
routes.get('/', (req, res) => {
    // For now just send an empty object and 200
    res.status(200).json({'message' : 'Hello Dan!'});
});

routes.get('/findByEmail/:email', async (req, res) => {
    const email = req.params.email;
    // Need to validate email
    const user = await getUserByEmail(email);

    res.status(200).json(user);
});

module.exports = {
    routes,
}
