const jwt = require('jsonwebtoken')
config = require('../config')

const error = require('../middleware/errors')

const secret = config.jwt.secret

function asigtoken (data) {
    return jwt.sign(data, secret)
}

function verificartoken(token) {
return jwt.verify(token, secret)
}

const chequeartoken = {
    confirmartoken: function(req, id){
        const decodificado = decodificarcabecera(req)

        if(decodificado.id !== id){
            throw new error("No tienes privilegios para hacer esto", 401);
            
        }
        
    }
}

function obtenertoken(autorizacion){
    if (!autorizacion) {
        throw new error("No viene token", 401);
        
    }

if (autorizacion.indexOf('Bearer') === -1) {
        throw new error("Formato invalido", 401);
        
    }
    let token = autorizacion.replace('Bearer ', '')

        return token;
    
}

function decodificarcabecera(req) {
    const autorizacion = req.headers.authorization || ''
    const token = obtenertoken(autorizacion)
    const decodificado = verificartoken(token)

    req.usuario = decodificado

    return decodificado
}

module.exports = {
    asigtoken,
    chequeartoken
}