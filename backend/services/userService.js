const userModel = require('../models/user_model');
const TodoModel = require('../models/user_toDo');

class userService{
    static async registerUser(email, password, name){
        try {
            const createUser = new userModel({email: email, password: password, name: name});
            return await createUser.save();
        } catch (error) {
            throw error;
        }
    }

    static async checkStudent(email){
        try {
            return await userModel.findOne({email})
        } catch (error) {
            throw error;
        }
    }

    static async createTodo(email, description) {
        try {
            const todo = await TodoModel.findOneAndUpdate(
                { email },
                { $push: { toDo: { description } } },
                { new: true, upsert: true }
            );
            return todo;
        } catch (error) {
            throw error;
        }
    }

    static async getTodos(email) {
        try {
            const todos = await TodoModel.findOne({ email });
            return todos ? todos.toDo : [];
        } catch (error) {
            throw error;
        }
    }
    static async updateTodo(email, todoId, updatedFields) {
        try {
            const todo = await TodoModel.findOneAndUpdate(
                { email, "toDo._id": todoId },
                { $set: { "toDo.$.description": updatedFields.description, "toDo.$.completed": updatedFields.completed } },
                { new: true }
            );
            return todo;
        } catch (error) {
            throw error;
        }
    }

    static async deleteTodo(email, todoId) {
        try {
            const todo = await TodoModel.findOneAndUpdate(
                { email },
                { $pull: { toDo: { _id: todoId } } },
                { new: true }
            );
            return todo;
        } catch (error) {
            throw error;
        }
    }

}

module.exports = userService;