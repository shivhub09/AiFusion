const mongoose = require('mongoose');

const connection = mongoose.createConnection('mongodb://127.0.0.1:27017/AiFusion').on('open', ()=>{
    console.log('mongodb connection established');
}).on('error', ()=>{
    console.log("error in connecting to mongodb server");
});

module.exports = connection;