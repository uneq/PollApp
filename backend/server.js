const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const path = require('path');
require('dotenv').config();

const backend = express();

//backend.use(cors());
backend.use(express.json());

const database = mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DB
})

backend.use(express.static('build'));

backend.get('/*', (req, res) => {
  res.sendFile(path.join(__dirname, 'build', 'index.html'));
});


backend.get('api/codes', (req, res) => {
    const sql = "SELECT * FROM codes"
    database.query(sql, (err, data) => {
        if (err) return err.json(err);
        return res.json(data);
    });

});

backend.put('api/codes', (req, res) => {
    const sql = `UPDATE codes SET Active = '0' WHERE Code = '${req.headers.code}'`;
    database.query(sql, (err) => {
        if (err) return err.json(err);
    });

    return res.status(200).json();

});

backend.post('api/codes', (req, res) => {
    for (let i = 0; i < req.body.codes.length; i++) {
        const sql = `INSERT INTO codes (Code, Active) VALUES('${req.body.codes[i]}','1')`;
        database.query(sql, (err) => {
            if (err) return err.json(err);
        });
    }
    return res.status(200).json();
});

backend.get('api/isactive', (req, res) => {
    const sql = `SELECT Active, Admin FROM codes WHERE Code = '${req.headers.code}'`;
    database.query(sql, (err, data) => {
        if (err) return err.json(err);
        return res.json(data);
    });
});

backend.get('api/boolean', (req, res) => {
    const sql = "SELECT * FROM question_boolean"
    database.query(sql, (err, data) => {
        if (err) return err.json(err);
        return res.json(data);
    });
});

backend.post('api/writevalues', (req, res) => {
    const sql = `INSERT INTO answer_${req.body.table} Values (NULL, (SELECT Code_ID FROM codes WHERE Code = '${req.body.code}'), '${req.body.questionID}', '${req.body.value}')`;
    database.query(sql, (err, data) => {
        if (err) return err.json(err);
        return res.json(data);
    });
});

backend.get('api/getvalues', (req, res) => {
    const sql = `SELECT Value FROM answer_${req.headers.table} WHERE ${req.headers.table}Question_ID = '${req.headers.id}'`;
    database.query(sql, (err, data) => {
        if (err) return err.json(err);
        return res.json(data);
    });
});

backend.get('api/scale', (req, res) => {
    const sql = "SELECT * FROM question_scale"
    database.query(sql, (err, data) => {
        if (err) return err.json(err);
        return res.json(data);
    });
});

backend.get('api/dilemma', (req, res) => {
    const sql = "SELECT * FROM question_dilemma"
    database.query(sql, (err, data) => {
        if (err) return err.json(err);
        return res.json(data);
    });
});

backend.get('api/text', (req, res) => {
    const sql = "SELECT * FROM question_text"
    database.query(sql, (err, data) => {
        if (err) return err.json(err);
        return res.json(data);
    });
});

backend.get('api/definition', (req, res) => {
    const sql = `SELECT Caption, Definition FROM definition WHERE Definition_ID = '${req.headers.id}'`;
    database.query(sql, (err, data) => {
        if (err) return err.json(err);
        return res.json(data);
    });
})


backend.listen(5000, () => {

});