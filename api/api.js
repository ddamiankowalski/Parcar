const express = require('express');
const dbutils = require('../database/db');
const router = express.Router();

/* This is where all API endpoints are */

router.get("/users", async (req, res) => {
    const [allUsers] = await dbutils.getAllUsers();

    allUsers.forEach(user => {
        console.log(user.email);
    })

    res.send(allUsers);
});

router.post("/user", async (req, res) => {
    res.send(req);
})

module.exports = router;