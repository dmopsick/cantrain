const express = require('express');

const {
    getAssignedWorkoutListByAssignedRegiment : getAssignedWorkoutListByAssignedRegiment,
    getAssignedWorkoutById : getAssignedWorkoutById,
} = require('../database');

const routes = express.Router({
    mergeParams: true
});

routes.get('/getListByAssignedRegiment/:assignedRegimentId', async (req, res) => {
    const assignedRegimentId = req.params.assignedRegimentId;

    const assignedWorkoutList = await getAssignedWorkoutListByAssignedRegiment(assignedRegimentId);

    res.status(200).json(assignedWorkoutList);
});

routes.get('/findById/:assignedWorkoutId', async (req, res) => {
    const assignedWorkoutId = req.params.assignedWorkoutId;

    const assignedWorkout = await getAssignedWorkoutById(assignedWorkoutId);
    
    res.status(200).json(assignedWorkout);
});

module.exports = {
    routes,
}
