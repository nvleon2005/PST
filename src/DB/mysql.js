const mysql = require('mysql2')

const config = require('../config');
const error  = require('../red/respuestas');

const dbconfig = {
    host : config.mysql.host,
    user : config.mysql.user,
    password : config.mysql.password,
    database : config.mysql.database
}

let conexion;

function conmysql() {
    conexion = mysql.createConnection(dbconfig);

    conexion.connect((err) => {
        if (err) {
            console.log('[DB err]', err)
            setTimeout(conmysql, 200)
        }else{
            console.log('Base de datos conectada')
        }
    });

    conexion.on('error', err => {
        console.log('DB err', err);
        if (err.code == 'PROTOCOL_CONNECTION_LOST') {
            conmysql()

        }else{
            throw err;
        }
    })
}

conmysql()

function todos (tabla) {

    return new Promise((resolve, reject) => {
        conexion.query(`SELECT * FROM ${tabla}`, (error, result) => {
            return error ? reject(error): resolve(result);
        })
    })
}

function uno (tabla, id) {
    return new Promise((resolve, reject) => {
        conexion.query(`SELECT * FROM ${tabla} WHERE id = ${id}`, (error, result) => {
        return error ? reject(error): resolve(result);
        })
    })
}

function agregar(tabla, data) {
    return new Promise((resolve, reject) => {
        conexion.query(`INSERT INTO ${tabla} SET ? ON DUPLICATE KEY UPDATE ?`, [data, data], (error, result) => {
        return error ? reject(error): resolve(result);
        }) 

        
    })
}


function eliminar (tabla, data) {
    return new Promise((resolve, reject) => {
        conexion.query(`DELETE FROM ${tabla} WHERE id = ?`, data.id, (error, result) => {
        return error ? reject(error): resolve(result);
        })
    })
}

function query(tabla, consulta) {
    return new Promise((resolve, reject) => {
        conexion.query(`SELECT * FROM ${tabla} WHERE ?`, consulta, (error, result) => {
         return error ? reject(error): resolve(result[0]);
        })
    })
}


function sql(consulta, params) {
    return new Promise((resolve, reject) => {
        conexion.query(consulta, params || [], (error, result) => {
            return error ? reject(error) : resolve(result);
        })
    })
}


module.exports = {
    todos,
    uno,
    agregar,
    eliminar,
    query,
    sql
}

