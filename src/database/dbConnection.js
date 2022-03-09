const pgp = require('pg-promise');

const connection = {
    host: 'localhost',
    port: 5432,
    database: 'postgres',
    user: 'postgres',
    password: '856412'
};

const db = pgp(conection)

module.exports = connection;

/*
const {
  DB_HOST, DB_PORT, DB_USER, DB_PASS, DB_DATABASE,
} = process.env;

const pool = mysql.createPool({
  host: DB_HOST,
  user: DB_USER,
  database: DB_DATABASE,
  password: DB_PASS,
  port: +DB_PORT,
  waitForConnections: true, // configure better
  connectionLimit: 10, // configure better
  queueLimit: 0, // configure better

});

module.exports = pool;*/