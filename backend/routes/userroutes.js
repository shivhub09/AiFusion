const router = require('express').Router();
const userController = require("../controllers/userController");

router.post('/registration', userController.register);
router.post('/login', userController.login);
router.post('/addToDo', userController.createTodo);
router.post('/getToDo', userController.getTodos);
router.post('/updateToDo', userController.updateTodo);
router.post('/deleteToDo', userController.deleteTodo);
module.exports = router;