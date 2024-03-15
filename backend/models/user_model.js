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

userSchema.methods.comparePassword = async function(userPassword){
    try{
        const ismatch = await bcrypt.comparePassword(userPassword, this.password);
        return ismatch;
    }catch (error){
    }
}

const userModel = db.model('user', userSchema);

module.exports = userModel;
