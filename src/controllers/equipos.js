var express = require('express')
var router = express.Router()
var Equipos = require('../models/Equipo')

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

router.get('/:grupo/:codigo', (req, res) => {
    let cod = req.params.codigo;
    let grupo = req.params.grupo;
    Equipos.findOne({
        where:{
            grupo: grupo,
            codigo: cod,
        }
    })
    .then(equipo =>{
    if(equipo){
      res.send(equipo)
    }else{
      res.status(400).sendStatus({error: 'Equipo invalido' })
    }
  })
  .catch(err => {
    res.status(400).sendStatus({error: err })
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