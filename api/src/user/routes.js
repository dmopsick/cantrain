const express = require('express');

const routes = express.Router({
    mergeParams: true
});

// Req (request) is what is coming in from the API, res (response) is what we are seinding back
routes.get('/', (req, res) => {
    // For now just send an empty object and 200
    res.status(200).json({"message" : "Hello Dan!"});
});

routes.get('/findByEmail/:email', (req, res) => {
    const email = req.params.email;
    var json = null;

    if (email == 'danmopsick@gmail.com') {
        json = {
            "userId" : 1,
            "email"  : "danmopsick@gmail.com"
        }
    } else {
        json = {
            "email" : "NOT DAN"
        }
    }
    
    res.status(200).json(json);
});

module.exports = {
    routes,
}
