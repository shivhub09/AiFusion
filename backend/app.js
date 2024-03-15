const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const app = express();

const userRouter = require('./routes/userroutes');

app.use(bodyParser.json());
app.use('/user', userRouter);


module.exports = app;