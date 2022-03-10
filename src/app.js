const express = require('express')
const cors = require('cors')
const { Pool } = require('pg')
const dotenv = require('dotenv');//acesso dados                  
//const pg = require('pg')
//var conString = "postgres://YourUserName:YourPassword@localhost:5432/YourDatabase";

dotenv.config();

const app = express();

const PORT = process.env.PORT || 5432;

const pgp = require('pg-promise');

const {
    DB_HOST, DB_PORT, DB_USER, DB_PASS, DB_DATABASE,
} = process.env;

const pool = new Pool({
    host: DB_HOST,
    user: DB_USER,
    database: DB_DATABASE,
    password: DB_PASS,
    port: +DB_PORT,
    waitForConnections: true, // configure better
    connectionLimit: 10, // configure better
    queueLimit: 0, // configure better

});


const db = pgp(pool)

app.use(express.json())
app.use(cors())


app.get('/news', function (_, res) {
    connection.query(`select * from noticias;`, function (error, results) {
        res.json(results)
    })
})

app.get('/leitores', (_, res) => {
    connection.query(`select * from leitores`, (error, results) => {
        res.json(results)
    })
})

app.listen(PORT, () => console.log(`Rodando na porta ${PORT}`));
