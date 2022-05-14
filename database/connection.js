const mysql = require('mysql2/promise');

const connection = mysql.createPool({
    host: 'localhost',
    user: 'admin',
    password: 't4jn3h4slo',
    database: 'parcar'
});

async function query(sql, params) {
    [rows, fields] = await connection.execute(sql, params);
    return rows;
}

module.exports = {
    query
}