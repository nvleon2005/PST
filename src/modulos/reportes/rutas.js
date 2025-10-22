const express = require('express')

const router = express.Router()

const respuesta = require('../../red/respuestas')

const controlador = require('./index')

router.get('/representantes-alumnos', async function(req, res, next) {
    try {
        const { page, limit } = req.query
        const data = await controlador.representantesConAlumnos(page && limit ? { page, limit } : undefined)
        respuesta.success(req, res, data, 200)
    } catch (err) {
        next(err)
    }
})

module.exports = router
