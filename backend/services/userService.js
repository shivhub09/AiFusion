const userModel = require('../models/user_model');

class userService{
    static async registerUser(email, password, name){
        try {
            const createUser = new userModel({email: email, password: password, name: name});
            return await createUser.save();
        } catch (error) {
            throw error;
        }
    }
}

module.exports = userService;