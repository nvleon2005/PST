const db = require('../../DB/mysql')

const TABLA = 'niveles';

module.exports = function (dbInyetada) {
    function todos () {

    let db = dbInyetada

    if (!db) {
        db = require('../../DB/mysql')
    }

    return db.todos(TABLA)
}

function uno (id) {
    return db.uno(TABLA, id)
    
}
function agregar (body) {

    return db.agregar(TABLA, body)
}


function eliminar (body) {
    return db.eliminar(TABLA, body)
}

    return{
    todos,
    uno, 
    agregar,
    eliminar}
}