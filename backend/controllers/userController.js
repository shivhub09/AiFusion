const userService = require('../services/userService');

exports.register = async (req, res , next)=>{
    try {
        const {email , password , name} = req.body;
        const successres = await userService.registerUser(email , password , name);

        res.json({status:true , success : "student registered successfully"});
    } catch (error) {
        throw error;
    }
}