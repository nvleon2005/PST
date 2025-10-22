const db = require('../../DB/mysql')

const auth = require('../../auth')

const TABLA = 'auth';

const bcrypt = require('bcrypt');


module.exports = function (dbInyetada) {

        let db = dbInyetada

        if (!db) {
            db = require('../../DB/mysql')
        }

        async function login(usuario, contraseña) {

            const data = await db.query(TABLA, {usuario : usuario})
            
                return bcrypt.compare(contraseña, data.contraseña)
                .then(resultado => {
                if (resultado === true) {
                   return auth.asigtoken({...data}) 
                }else{
                    throw new Error('Informacion invalida')
                }
                    
                })
        }


    async function agregar (data) {

        console.log(data)

        const authdata = {
            id : data.id,
        }

        if(data.usuario) {
            authdata.usuario = data.usuario
        }

        if(data.contraseña) {
            authdata.contraseña = await bcrypt.hash(data.contraseña.toString(), 6)
        }

        return db.agregar(TABLA, authdata)
    }





    return{
        agregar,
        login}

}
