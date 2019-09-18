var express = require('express')
var router = express.Router()
var Equipos = require('../models/Equipo')
const db = require('../db/db');

//GET usuarios
router.get('/', (req, res) => {
    Equipos.findAll()
    .then(equipos => {
        res.send(equipos)
    })
    .catch(err => {
        res.status(400).sendStatus({error: err })
    })
});

//GET usuarios
router.get('/:grupo', (req, res) => {
  Equipos.findAll()
  .then(equipos => {
      res.send(equipos)
  })
  .catch(err => {
      res.status(400).sendStatus({error: err })
  })
});

router.get('/xgrupo/:grupo', (req, res) => {
    let grupo = req.params.grupo;
    db.sequelize.query(`SELECT * FROM equipos as e
    WHERE e.grupo='${grupo}'`)
    .then(grupos => {
    res.send(grupos[0])
  }).catch(err => {
    res.status(400).sendStatus({
      error: err
    })
  })
});

router.post('/', (req, res) => {
  if (!req.body){
    return res.status(400).sendStatus({ success: false, message: "Bad Request", info: null })
  }else{
    Equipos.create(req.body)
    .then(data=> {
      res.send(data)
    })
    .catch(err => {
      res.status(400).send({error: err })
    })  
  }
});

//DELETE usuario
router.delete('/:grupo/:codigo', (req, res) => {
  let cod = req.params.codigo;
  let grupo = req.params.grupo;
  Equipos.destroy({
    where: {
        grupo: grupo,
        codigo: cod
    }
  })
  .then(()=>{
    res.send({info:'Equipo Eliminado'})
  })
  .catch(err => {
    res.status(400).send({error: err })
  })  
});

//PUT usuario
router.put('/:grupo/:codigo',(req,res)=>{
  let cod  = req.params.codigo;
  let grupo = req.params.grupo;
  if (!req.body){
    return res.status(400).sendStatus({ success: false, message: "Bad Request", info: null })
  }else{
    Equipos.update(req.body, {
      where: {
        grupo: grupo,
        codigo: cod
      }
    })
    .then(() => {
      res.send({info:'Equipo Actualizado'})
    })
    .catch(err => {
      res.status(400).send({error: err })
    })  
  }
})


module.exports = router