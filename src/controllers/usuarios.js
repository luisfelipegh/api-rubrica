var express = require('express')
var router = express.Router()
var Usuario = require('../models/Usuario')

//GET usuarios
router.get('/', (req, res) => {
  Usuario.findAll()
  .then(usuarios => {
    res.send(usuarios)
  })
  .catch(err => {
    res.status(400).sendStatus({error: err })
  })
});

//GET estudiantes
router.get('/estudiantes', (req, res) => {
  Usuario.findAll({
    where:{
      tipo: 'ESTUDIANTE'
    }
  })
  .then(usuarios =>{
    if(usuarios){
      res.send(usuarios)
    }else{
      res.status(400).sendStatus({error: 'Usuario invalido' })
    }
  })
  .catch(err => {
    res.status(400).sendStatus({error: err })
  })  
});

//GET usuario
router.get('/profesores', (req, res) => {
  Usuario.findAll({
    where:{
      tipo: 'PROFESOR'
    }
  })
  .then(usuarios =>{
    if(usuarios){
      res.send(usuarios)
    }else{
      res.status(400).sendStatus({error: 'Usuario invalido' })
    }
  })
  .catch(err => {
    res.status(400).sendStatus({error: err })
  })  
});

//GET usuario
router.get('/:correo', (req, res) => {
  let mail = req.params.correo;
  Usuario.findOne({
    where:{
      correo: mail
    }
  })
  .then(usuario =>{
    if(usuario){
      res.send(usuario)
    }else{
      res.status(400).sendStatus({error: 'Usuario invalido' })
    }
  })
  .catch(err => {
    res.status(400).sendStatus({error: err })
  })  
});


//POST new usuario
router.post('/', (req, res) => {
  if (!req.body){
    return res.status(400).sendStatus({ success: false, message: "Bad Request", info: null })
  }else{
    Usuario.create(req.body)
    .then(data=> {
      res.send(data)
    })
    .catch(err => {
      res.status(400).send({error: err })
    })  
  }
});

//DELETE usuario
router.delete('/:correo', (req, res) => {
  let mail = req.params.correo;
  Usuario.destroy({
    where: {correo: mail}
  })
  .then(()=>{
    res.send({info:'usuario Eliminado'})
  })
  .catch(err => {
    res.status(400).send({error: err })
  })  
});

//PUT usuario
router.put('/:correo',(req,res)=>{
  let mail  = req.params.correo;
  if (!req.body){
    return res.status(400).sendStatus({ success: false, message: "Bad Request", info: null })
  }else{
    Usuario.update(req.body, {
      where: {correo: mail}
    })
    .then(() => {
      res.json({status: 'Usuario actualizado'})
    })
    .catch(err => {
      res.status(400).send({error: err })
    })  
  }
})

module.exports = router