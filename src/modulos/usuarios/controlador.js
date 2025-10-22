const db = require('../../DB/mysql')
const auth = require('../auth')


const TABLA = 'Usuarios';

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

async function agregar (body){
    
    const usuario = {
        id : body.id,
        nombre_usu : body.nombre_usu,
        email : body.email,
        role : body.role,
        status : body.status

    }

    const respuesta = await db.agregar(TABLA, usuario)
    let insertid = 0;

    if (body.id == 0) {
        insertid = respuesta.insertId || respuesta.id
    }else{
        insertid = body.id
    }


    let respuesta2 = '' 
    if(body.nombre_usu || body.contraseña) {

        respuesta2 = await auth.agregar({
            
            id : insertid,
            usuario : body.nombre_usu,
            contraseña : body.contraseña
        }
        )
    }

    return respuesta2;
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