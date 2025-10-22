const express = require('express')

const router = express.Router()

const respuesta = require('../../red/respuestas')

const controlador = require('./index')


router.get('/login', login)

async function login (req, res, next){
    try {
        const token = await controlador.login(req.body.usuario, req.body.contraseña)      
        respuesta.success(req, res, token, 200)
        
    } catch (err) {
        next(err);
    }

};

module.exports = router