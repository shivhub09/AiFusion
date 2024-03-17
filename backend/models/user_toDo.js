const mongoose = require("mongoose");
const db = require("../configuration/db");

const {Schema} = mongoose;

const todoSchema = new Schema({
    email:{
        type:String,
        lowercase:true,
        required:true,
        unique:true,
    },

    toDo:{
        type: [{
            description: {
                type: String,
                required: true
            },
            completed: {
                type: Boolean,
                default: false
            }
        }],
        default: [],
    }
});

const toDoModel = db.model('toDo', todoSchema);

module.exports = toDoModel;