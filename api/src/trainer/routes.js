const express = require('express');

// Load the data base functions
const {
    getTrainerById : getTrainerById
} = require('../database');

const routes = express.Router({
    mergeParams: true
});

routes.get('/findById/:id', async (req, res) =>  {
    const id = req.params.id;

    const trainer = await getTrainerById(id);

    res.status(200).json(trainer);
});

module.exports = {
    routes,
}

