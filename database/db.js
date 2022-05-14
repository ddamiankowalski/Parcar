const express = require("express");
const uuid = require('uuid');
const connection = require('./config');

const router = express.Router();

/* Utils functions such as generateUUID() and so on */

const generateUUID = () => {
    
}

/* This is where all the database functionality will be placed */

const getAllUsers = async () => {
    const sql = 'SELECT * FROM Users';
    const result = await connection.promise().query(sql);

    return result;
}

const newUser = async (firstName, lastName, email, age) => {
    const uuid = generateUUID();
    const sql = `INSERT INTO Users (id, email, firstName, lastName, age) VALUES ('${uuid}', '${email}', '${firstName}', '${lastName}', '${age}')`;

}

module.exports = {
    getAllUsers,
};