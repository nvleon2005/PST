const express = require('express')

const morgan = require('morgan')

const config = require('./config')

const usuarios = require('./modulos/usuarios/rutas')

const representantes = require('./modulos/representantes/rutas')

const empleados = require('./modulos/empleados/rutas')

const transacciones = require('./modulos/transacciones/rutas')

const conceptos = require('./modulos/conceptos/rutas')

const nivel = require('./modulos/nivel/rutas')

const alumnos = require('./modulos/alumnos/rutas')

const personas = require('./modulos/persona/rutas')

const divisas = require('./modulos/divisas/rutas')

const perfil = require('./modulos/perfil/rutas')

const auth = require('./modulos/auth/rutas')
const reportes = require('./modulos/reportes/rutas')

const app = express()

const error = require('./red/errors')
//Middleware

app.use(morgan('dev'))
app.use(express.json())
app.use(express.urlencoded({extended: true}))




//configuracion
app.set('port', config.app.port)

//Rutas
app.use('/api/usuarios', usuarios)


app.use('/api/empleados', empleados)

app.use('/api/representantes', representantes)

app.use('/api/alumnos', alumnos)


app.use('/api/transacciones', transacciones)

app.use('/api/conceptos', conceptos)

app.use('/api/niveles', nivel)

app.use('/api/empleados', empleados)

app.use('/api/personas', personas)

app.use('/api/divisas', divisas)

app.use('/api/perfil', perfil)

app.use('/api/auth', auth)

app.use('/api/reportes', reportes)

app.use(error)



module.exports = app;