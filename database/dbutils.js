const express = require("express");
const uuid = require('uuid');
const db = require('./connection');

const router = express.Router();

/* Utils functions such as generateUUID() and so on */

const generateUUID = () => {
    return uuid.v4();
}

/* This is where all the database functionality will be placed */

const getAllUsers = async () => {
    const sql = 'SELECT * FROM users';
    const data = await db.query(sql);

    return data;
}

const newUser = async (firstName, lastName, email, age) => {
    if(!email) throw new Error('Email was not provided by the user');

    const sql = `INSERT INTO users (id, email, first_name, last_name, age) VALUES ('${generateUUID()}', '${email}', '${firstName}', '${lastName}', '${age}')`;
    await db.query(sql);
}

const getUser = async (userId) => {
    const sql = `SELECT * FROM users WHERE users.id = '${userId}'`;
    const data = await db.query(sql);

    return data[0];
}

module.exports = {
    getAllUsers,
    newUser,
    getUser
};