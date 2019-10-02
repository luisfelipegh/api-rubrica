var express = require('express')
var router = express.Router()
var Actividad = require('../models/Actividad')
const db = require('../db/db');

//GET actividades
router.get('/', (req, res) => {
    Actividad.findAll()
    .then(actividades => {
        res.send(actividades)
    })
    .catch(err => {
        res.status(400).sendStatus({error: err })
    })
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
    Actividad.update(req.body, {
        where: {
          id: id
        }
      })
      .then(() => {
        res.send({
          info: 'Actividad Actualizado'
        })
      })
      .catch(err => {
        res.status(400).send({
          error: err
        })
      })
  }
})

//Get creador
router.get('/creador/:creador', (req, res) => {
    let creator = req.params.usuario;
    Actividad.findAll({
      where:{
        creador: creator
      }
    })
    .then(actividades => {
      res.send(actividades)
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
    Actividad.create(req.body)
    .then(data=> {
      res.send(data)
    })
    .catch(err => {
      res.status(400).send({error: err })
    })  
  }
});

//DELETE usuario
router.delete('/:id', (req, res) => {
  let id = req.params.id;
  Actividad.destroy({
    where: {
        id: id,
    }
  })
  .then(()=>{
    res.send({info:'Equipo Eliminado'})
  })
  .catch(err => {
    res.status(400).send({error: err })
  })  
});


module.exports = router