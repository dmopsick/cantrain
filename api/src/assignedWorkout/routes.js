const express = require('express');

const {
    getAssignedWorkoutListByAssignedRegiment : getAssignedWorkoutListByAssignedRegiment
} = require('../database');

const routes = express.Router({
    mergeParams: true
});

routes.get('/getListByAssignedRegiment/:assignedRegimentId', async (req, res) => {
    const assignedRegimentId = req.params.assignedRegimentId;

    const assignedWorkoutList = await getAssignedWorkoutListByAssignedRegiment(assignedRegimentId);

    res.status(200).json(assignedWorkoutList);
});

module.exports = {
    routes,
}
