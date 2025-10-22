
# Backend PST 3

Descripción
-----------
API REST desarrollada con Node.js y Express. Contiene módulos para usuarios, empleados, representantes, alumnos, transacciones, conceptos, niveles, personas, divisas, perfil y autenticación.

Requisitos
----------
- Node.js (recomendado >= 18)
- MySQL
- npm

Instalación
-----------

2. Instalar dependencias:
```bash
npm install
```

3. Crear un archivo `.env` en la raíz con las variables necesarias (ejemplo abajo).

Configuración
-------------
Variables de entorno (ejemplo `.env`):

```
PORT=4000
JET_SECRET=TuSecretoJWT
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASSWORD=
MYSQL_DB=Administracion
```

Notas importantes sobre la configuración:
- La aplicación lee las variables desde `process.env` en `src/config.js`.
- El nombre de la variable para la clave secreta JWT en el código es `JET_SECRET`  — si cambia a `JWT_SECRET` debe actualizar `src/config.js`.

Scripts útiles
-------------
- `npm run dev` — inicia la aplicación con `nodemon` (observa cambios).

Ejecutar la API
--------------
iniciar la API:

```bash
npm run dev
```

Por defecto la aplicación usa el puerto definido en `PORT` (4000 si no se define). La URL base será:

http://localhost:4000

Formato de respuestas
---------------------
Las respuestas exitosas y errores siguen el formato (según `src/red/respuestas.js`):

```json
{
	"error": false,
	"status": 200,
	"body": {}
}
```

Rutas disponibles
------------------
La mayoría de los módulos exponen las mismas rutas REST básicas bajo el prefijo `/api/<recurso>`:

- GET /api/<recurso>        — obtener lista
- GET /api/<recurso>/:id    — obtener un elemento por id
- POST /api/<recurso>       — crear o actualizar (según body.id)
- DELETE /api/<recurso>     — eliminar (se envía el body con el identificador)

Módulos detectados y sus prefijos montados en `src/app.js`:

- `/api/usuarios`      — rutas definidas en `src/modulos/usuarios/rutas.js` (POST y DELETE usan middleware de seguridad)
- `/api/empleados`     — `src/modulos/empleados/rutas.js`
- `/api/representantes`— `src/modulos/representantes/rutas.js`
- `/api/alumnos`       — `src/modulos/alumnos/rutas.js`
- `/api/transacciones` — `src/modulos/transacciones/rutas.js`
- `/api/conceptos`     — `src/modulos/conceptos/rutas.js`
- `/api/niveles`       — `src/modulos/nivel/rutas.js`
- `/api/personas`      — `src/modulos/persona/rutas.js`
- `/api/divisas`       — `src/modulos/divisas/rutas.js`
- `/api/perfil`        — `src/modulos/perfil/rutas.js`
- `/api/auth`          — `src/modulos/auth/rutas.js`
- `/api/reportes`      — `src/modulos/reportes/rutas.js`



Detalles y ejemplos
--------------------
Nota: el módulo de reportes está montado en `/api/reportes`.
--------------------
Ejemplo: obtener la lista de empleados

```bash
curl -s http://localhost:4000/api/empleados
```

Ejemplo: obtener un empleado por id

```bash
curl -s http://localhost:4000/api/empleados/123
```

Ejemplo: crear/actualizar (POST)

```bash
curl -X POST http://localhost:4000/api/empleados \
	-H "Content-Type: application/json" \
	-d '{"id":0, "nombre":"Juan", "apellido":"Perez"}'
```

Ejemplo: eliminar

```bash
curl -X DELETE http://localhost:4000/api/empleados \
	-H "Content-Type: application/json" \
	-d '{"id":123}'
```

Rutas de autenticación
----------------------
El módulo de `auth` tiene la ruta:

- GET `/api/auth/login` — implementado en `src/modulos/auth/rutas.js`


- Seguridad
---------
- En `src/modulos/usuarios/rutas.js` el POST y DELETE aplican un middleware de seguridad (`src/modulos/usuarios/seguridad.js`) que llama a `auth.chequeartoken.confirmartoken(req, id)` — por lo que se espera un token JWT válido para operar en esas rutas.
- la clave secreta JWT se obtiene desde `process.env.JET_SECRET` via `src/config.js`.

Paginación del endpoint de reportes
----------------------------------
El endpoint de reportes soporta paginación para evitar cargar todos los datos en memoria.

- GET `/api/reportes/representantes-alumnos` — devuelve todos 
- GET `/api/reportes/representantes-alumnos?page=1&limit=20` — devuelve la página 1 con 20 representantes por página. Para cada página el servidor:
	1. trae los representantes de la página (LIMIT/OFFSET),
	2. trae los alumnos que referencian a esos representantes (filtrando por columnas comunes como `representante_1`),
	3. trae las filas de `persona` necesarias para enriquecer los registros.

Ejemplo:

```bash
curl -s "http://localhost:4000/api/reportes/representantes-alumnos?page=1&limit=20"
```


Uso de Postman
----------------------
En la raiz de proyecto, estan las colecciones de postman, que pueden importar
para acceder a las diferentes rutas.

postman_collection
