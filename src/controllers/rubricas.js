var express = require('express')
var router = express.Router()
var Rubrica = require('../models/Rubrica')

//GET rubricas
router.get('/', (req, res) => {
  Rubrica.findAll()
  .then(rubricas => {
    res.send(rubricas)
  })
  .catch(err => {
    res.status(400).send({error: err })
  })
});

//GET Rubrica by semestre
router.get('/:semestre', (req, res) => {
  let sem = req.params.semestre;
  Rubrica.findOne({
    semestre: sem
  }).then(rubrica =>{
    rubrica ? res.send(rubrica) :  res.status(400).send({error: 'Rubrica no existe' })
  }).catch(err =>{
    res.status(400).send({error: err })
  })
});

module.exports = router