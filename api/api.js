const express = require('express');
const dbutils = require('../database/dbutils');
const router = express.Router();
const jwt = require('jsonwebtoken');

/* getAllUsers functionality, returns all users from the database in JSON format */

router.get("/users", async (req, res) => {
    const allUsers = await dbutils.getAllUsers();

    res.send(allUsers);
});

/* getUser functionality, returns a user with a given ID */

router.get("/user/:id", async (req, res) => {
    const userId = req.params.id;
    const user = await dbutils.getUser(userId);
    
    if(!user) {
        const errObj = {
            status: "failure",
            message: `User with id of ${userId} does not exist`
        }

        res.send(errObj);
    } else {
        res.send(user);
    }
})

/* newUser functionality, creates a new user with a name, email (required), and age */

router.post("/user", async (req, res) => {
    const userData = req.body;

    try {
        await dbutils.newUser(userData.firstName, userData.lastName, userData.email, userData.age);
        res.sendStatus(res.statusCode);
    } catch (err) {
        const errObj = {
            status: "failure",
            message: err.message
        }
        res.send(errObj);
    }
})


/* signIn functionality, allows a user to sign in and exchange jwt */

router.post("/signin", async(req, res) => {
    const loginInfo = req.body;

    try {
        const user = await dbutils.logIn(loginInfo.username, loginInfo.password);

        if(!user) {
            return {
                status: "failure",
                message: "The creditentials are incorrect"
            }
        }

        const accessToken = jwt.sign(user.username, process.env.ACCESS_TOKEN_SECRET);
        res.json({ accessToken: accessToken });
    } catch (err) {
        const errObj = {
            status: "failure",
            message: err.message
        }
        res.send(errObj);
    }
})

module.exports = router;