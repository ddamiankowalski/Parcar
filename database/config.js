const mysql = require('mysql2');

const connection = mysql.createPool({
    host: 'localhost',
    user: 'admin',
    password: 't4jn3h4slo',
    database: 'parcar'
})

module.exports = connection;