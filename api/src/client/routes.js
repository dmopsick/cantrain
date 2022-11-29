const express = require('express');

// Load databse functions used in this file
const {
    getClientByUserId: getClientByUserId
} = require('../database');

const routes = express.Router({
    mergeParams: true
});

routes.get('/findByUser/:userId', async (req, res) => {
    const userId = req.params.userId;

    const client = await getClientByUserId(userId);

    res.status(200).json(client);
});

module.exports = {
    routes,
}
