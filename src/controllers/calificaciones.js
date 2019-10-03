var express = require('express')
var router = express.Router()
var Calificacion = require('../models/Calificacion')
const db = require('../db/db');

//GET Calificaciones
router.get('/', (req, res) => {
    Calificacion.findAll()
    .then(calificaciones => {
        res.send(calificaciones)
    })
    .catch(err => {
        res.status(400).sendStatus({error: err })
    })
});

//Get Calificaciones profesor
router.get('/:id', (req, res) => {
  let id = req.params.id;
  Calificacion.findOne({
    where:{
      id: id
    }
  })
  .then(calificacion => {
    res.send(calificacion)
  })
  .catch(err => {
    res.status(400).sendStatus({error: err })
  })
});

//Get Calificaciones profesor
router.get('/profesor/:profesor', (req, res) => {
  let pfsr = req.params.usuario;
  Calificacion.findAll({
    where:{
      profesor: pfsr
    }
  })
  .then(calificaciones => {
    res.send(calificaciones)
  })
  .catch(err => {
    res.status(400).sendStatus({error: err })
  })
});

//Get Calificaciones calificado
router.get('/calificado/:calificado', (req, res) => {
  let creator = req.params.usuario;
  Calificacion.findAll({
    where:{
      creador: creator
    }
  })
  .then(Calificaciones => {
    res.send(Calificaciones)
  })
  .catch(err => {
    res.status(400).sendStatus({error: err })
  })
});

//Post One
router.post('/', (req, res) => {
  if (!req.body){
    return res.status(400).sendStatus({ success: false, message: "Bad Request", info: null })
  }else{
    Calificacion.create(req.body)
    .then(data=> {
      res.send(data)
    })
    .catch(err => {
      res.status(400).send({error: err })
    })  
  }
});

//PUT Grupo
router.put('/:id', (req, res) => {
  let id = req.params.id;
  if (!req.body) {
    return res.status(400).sendStatus({
      success: false,
      message: "Bad Request",
      info: null
    })
  } else {
    Calificacion.update(req.body, {
        where: {
          id: id
        }
      })
      .then(() => {
        res.send({
          info: 'Calificacion Actualizado'
        })
      })
      .catch(err => {
        res.status(400).send({
          error: err
        })
      })
  }
})

//DELETE usuario
router.delete('/:id', (req, res) => {
  let id = req.params.id;
  Calificacion.destroy({
    where: {
        id: id,
    }
  })
  .then(()=>{
    res.send({info:'Calificacion Eliminada'})
  })
  .catch(err => {
    res.status(400).send({error: err })
  })  
});


module.exports = router