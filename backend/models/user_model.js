const mongoose = require('mongoose');
const db = require('../configuration/db');

const {Schema} = mongoose;

const userSchema = new Schema({
    email:{
        type:String,
        lowercase:true,
        required:true,
        unique:true,
    },

    password:{
        type:String,
        required:true,
    },

    name:{
        type:String,
        required:true,
    }
});

const userModel = db.model('user', userSchema);

module.exports = userModel;