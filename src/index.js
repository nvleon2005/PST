const app = require('./app')

app.listen(app.get('port'), () =>{
    console.log('Esta funcionando', app.get('port'))
})