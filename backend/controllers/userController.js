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

exports.login = async (req, res , next)=>{
    try {
        const {email , password} = req.body;
        const user = await userService.checkStudent(email);
        
        if(!user){
            throw new Error("student not found");
        }

        if(user.password == password){
            res.status(200).json({
                status: true,
                student: {
                    email: user.email,
                    name: user.name,
                }
            });
        }

        else{
            throw new Error("student not found");
        } 

    } catch (error) {
        throw error;
    }
}