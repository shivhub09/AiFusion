const router = require('express').Router();
const userController = require("../controllers/userController");

router.post('/registration', userController.register);
router.post('/login', userController.login);

module.exports = router;