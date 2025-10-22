const db = require('../../DB/mysql')

module.exports = function (dbInyectada) {
  const _db = dbInyectada || db;

  async function representantesConAlumnos() {
    const sql = `
      SELECT
        A.id AS alumno_id,
        PA.nombres AS alumno_nombre,
        PA.apellidos AS alumno_apellido,
        PA.sexo AS alumno_sexo,
        A.nivel_actual,
        R.id AS representante_id,
        PR.nombres AS representante_nombre,
        PR.apellidos AS representante_apellido,
        R.profesion AS representante_profesion,
        R.telefono AS representante_telefono
      FROM alumnos A
      LEFT JOIN persona PA ON PA.id = A.id
      LEFT JOIN representantes R ON R.id = A.representante_1
      LEFT JOIN persona PR ON PR.id = R.id;
    `
    try {
      const rows = await _db.sql(sql, []) 
      return rows 
    } catch (err) {
      console.error('[db] Error:', err.sqlMessage || err.message)
      throw new Error('Error de DB: ' + (err.sqlMessage || err.message))
    }
}
   
  return { representantesConAlumnos }
}