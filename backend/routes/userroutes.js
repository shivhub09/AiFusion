const router = require('express').Router();
const userController = require("../controllers/userController");

router.post('/registration', userController.register);
router.post('/login', userController.login);
router.post('/todo', userController.createTodo);
router.post('/todos', userController.getTodos);
router.put('/todos/:email/:todoId', userController.updateTodo);
router.delete('/todos/:email/:todoId', userController.deleteTodo);
module.exports = router;