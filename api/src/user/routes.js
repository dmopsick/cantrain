const express = require('express');

const routes = express.Router({
    mergeParams: true
});

// Req (request) is what is coming in from the API, res (response) is what we are seinding back
routes.get('/', (req, res) => {
    // For now just send an empty object and 200
    res.status(200).json({});
});
