const express = require('express');

const {
    getAssignedRegimentListByClient: getAssignedRegimentListByClient,
    getAssignedRegimentListByUser: getAssignedRegimentListByUser,
    getAssignedRegimentById : getAssignedRegimentById,
} = require('../database');

const routes = express.Router({
    mergeParams: true
});

routes.get('/getListByClient/:clientId', async (req, res) => {
    const clientId = req.params.clientId;

    const assignedRegimentList = await getAssignedRegimentListByClient(clientId);

    res.status(200).json(assignedRegimentList);
});

routes.get('/findById/:assignedRegimentId', async (req, res) =>  {
    const assignedRegimentId = req.params.assignedRegimentId;

    const assignedRegiment = await getAssignedRegimentById(assignedRegimentId);
    
    res.status(200).json(assignedRegiment);
});

routes.get('/getListbyUser/:userId', async (req, res) => {
    const userId = req.params.userId;
    
    const assignedRegimentList = await getAssignedRegimentListByUser(userId);

    res.status(200).json(assignedRegimentList);
});

module.exports = {
    routes,
}
