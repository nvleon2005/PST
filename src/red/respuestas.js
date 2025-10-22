exports.success = function (req, res, mensaje, status) {
    const statuscode = status || 200;
    const mensajeok = mensaje || '';
    res.status(statuscode).send({
        error : false,
        status: status,
        body: mensajeok        
    });
}

exports.error = function (req, res, mensaje, status) {
    const statuscode = status || 500;
    const mensajerror = mensaje || 'Error interno';
    res.status(statuscode).send({
        error : false,
        status: status,
        body: mensajerror        
    });
}