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

exports.createTodo = async (req, res, next) => {
    try {
        const { email, description } = req.body;
        const todo = await userService.createTodo(email, description);
        res.status(201).json({ status: true, todo });
    } catch (error) {
        next(error); // Pass the error to the error handling middleware
    }
}

exports.getTodos = async (req, res, next) => {
    try {
        const { email } = req.body;
        const todos = await userService.getTodos(email);
        res.status(200).json({ status: true, todos });
    } catch (error) {
        next(error); // Pass the error to the error handling middleware
    }
}

exports.updateTodo = async (req, res, next) => {
    try {
        const { email, todoId, updatedFields } = req.body;
        const todo = await userService.updateTodo(email, todoId, updatedFields);
        res.status(200).json({ status: true, todo });
    } catch (error) {
        next(error); // Pass the error to the error handling middleware
    }
}



exports.deleteTodo = async (req, res, next) => {
    try {
        const {email , title } = req.body;
        await userService.deleteTodo(email , title);
        res.status(200).json({ status: true, message: "successfully deleted" });
    } catch (error) {
        next(error); // Pass the error to the error handling middleware
    }
}
