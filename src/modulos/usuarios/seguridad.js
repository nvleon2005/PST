const auth = require('../../auth')

module.exports = function cheqauth() {

    function middleware(req, res, next) {
        const id = req.body.id
        auth.chequeartoken.confirmartoken(req, id)
        next()
    }

    return middleware
}