const express = require("express");
const uuid = require('uuid');
const db = require('./connection');
const crypto = require('crypto');

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

const logIn = async (username, password) => {
    return { name: username, password: 'password' }
}

const registerUser = async (email, password) => {
    const sql = `INSERT INTO users (id, email, pw_hash) VALUES ('${generateUUID()}', '${email}', '${generatePasswordHash(password)}')`;
    await db.query(sql);
}

const generatePasswordHash = (password) => {
    const hashingSecret = "ParcarSecret_hash";
    const hashedPassword = crypto.createHmac('sha256', hashingSecret)
                                .update(password)
                                .digest('hex');

    return hashedPassword;
}

module.exports = {
    getAllUsers,
    newUser,
    getUser,
    logIn,
    registerUser
};