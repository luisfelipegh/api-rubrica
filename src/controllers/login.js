const express = require("express");
const router = express.Router();
const jwt = require('jsonwebtoken');
var Usuario = require('../models/Usuario')


router.post('/',(req, res)=>{
  if (!req.body)
    return res.status(400).send({ success: false, message: "Bad Request", info: null })
  let {correo, contrasena} = req.body;
  Usuario.findOne({
    where:{correo: correo, contrasena: contrasena}
  })
  .then(usuario =>{
    if(usuario){
      //CREAR Y ENVIAR TOKEN
      let token = jwt.sign({
        data: usuario
      }, 'rubrica', { expiresIn: '1h' });
      res.send({token})
    }else{
      res.status(400).send({error: 'Usuario invalido' })
    }
  })
  .catch(err => {
    var error = err
    res.status(400).send({error: ''+error })
  }) 
})

module.exports = router