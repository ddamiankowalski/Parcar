const express = require('express');
const dbutils = require('../database/dbutils');
const router = express.Router();
const jwt = require('jsonwebtoken');
require('dotenv').config();

/* getAllUsers functionality, returns all users from the database in JSON format */

router.get("/users", authenticateToken, async (req, res) => {
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

/* Register functionality, allows the user to create a new entry in user table */

router.post("/register", async(req, res) => {
    const userData = req.body;

    try {
        await dbutils.registerUser(userData.email, userData.password);
        res.sendStatus(res.statusCode);
    } catch (err) {
        const errObj = {
            status: "register failure",
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

        const accessToken = generateAccessToken(user);
        const refreshToken = jwt.sign(user, process.env.REFRESH_TOKEN_SECRET);
        res.json({ accessToken: accessToken, refreshToken: refreshToken });
    } catch (err) {
        const errObj = {
            status: "failure",
            message: err.message
        }
        res.send(errObj);
    }
})

router.post("/newtoken", (req, res) => {
    const refreshToken = req.body.token;

    if(refreshToken == null) res.sendStatus(401);
    if(!checkForTokensTable()) res.sendStatus(403);

    jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET, (err, user) => {
        if(err) return res.sendStatus(403);
        
        const accessToken = generateAccessToken({ name: user.name });
        res.json({ accessToken: accessToken });
    });
})

router.delete("/logout", (req, res) => {
    // here create a db function that deletes a refresh token
})

function authenticateToken(req, res, next) {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];
    if (token == null) res.sendStatus(401);

    jwt.verify(token, process.env.ACCESS_TOKEN_SECRET, (err, user) => {
        if(err) return res.sendStatus(403);

        req.user = user;
        console.log(req.user)
        next();
    })
}

function generateAccessToken(user) {
    return jwt.sign(user, process.env.ACCESS_TOKEN_SECRET, { expiresIn: '15s' });
}

function checkForTokensTable() {
    // this is where in the future we need to check in the database for a token
    return true;
}

module.exports = router;