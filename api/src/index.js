const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const {
    routes: userRoutes,
} = require('./user/routes');

const {
    routes: trainerRoutes,
} = require('./trainer/routes');

const {
    routes: clientRoutes,
} = require('./client/routes');

const {
    routes: assignedRegimentRoutes,
} = require('./assignedRegiment/routes');

const {
    routes: assignedWorkoutRoutes,
} = require('./assignedWorkout/routes');

const {
    routes: assignedExerciseRoutes,
} = require('./assignedExercise/routes');

const app = express();

app.use(cors());
app.use(bodyParser.json());
app.use('/user', userRoutes);
app.use('/trainer', trainerRoutes);
app.use('/client', clientRoutes);
app.use('/assignedRegiment', assignedRegimentRoutes);
app.use('/assignedWorkout', assignedWorkoutRoutes);
app.use('/assignedExercise', assignedExerciseRoutes);

module.exports = app;
