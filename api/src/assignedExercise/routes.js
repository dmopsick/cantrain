const express = require('express');

const {
    getAssignedExerciseListByAssignedWorkout : getAssignedExerciseListByAssignedWorkout,
    getAssignedExerciseById : getAssignedExerciseById,
} = require('../database');

const routes = express.Router({
    mergeParams: true
});

routes.get('/getListByAssignedWorkout/:assignedWorkoutId', async (req, res) => {
    const assignedWorkoutId = req.params.assignedWorkoutId;

    const assignedExerciseList = await getAssignedExerciseListByAssignedWorkout(assignedWorkoutId);

    res.status(200).json(assignedExerciseList);
});

routes.get('/findById/:assignedExerciseId', async (req, res) => {
    const assignedExerciseId = req.params.assignedExerciseId;

    const assignedExercise = await getAssignedExerciseById(assignedExerciseId);

    res.status(200).json(assignedExercise);
});

module.exports = {
    routes,
}
