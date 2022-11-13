const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const {
    routes: userRoutes,
} = require('./user/routes');

const {
    routes: trainerRoutes,
} = require('./trainer/routes');

const app = express();

app.use(cors());
app.use(bodyParser.json());
app.use('/user', userRoutes);
app.use('/trainer', trainerRoutes);

module.exports = app;
