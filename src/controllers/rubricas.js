var express = require('express')
var router = express.Router()
var Rubrica = require('../models/Rubrica')
const db = require('../db/db');

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

//GET uno
router.get('/one/:id', (req, res) => {
  let id = req.params.id;
  db.sequelize.query(`SELECT r.*, u.nombre nombre_creador , concat( r.nombre,' - ',  u.nombre) as label FROM rubricas as r 
  join usuarios as u
  on r.creador = u.correo WHERE r.id='${id}'`)
  .then(estudiantes => {
  res.send(estudiantes[0][0])
}).catch(err => {
  res.status(400).sendStatus({
    error: err
  })
})
});

//GET Rubrica by semestre
router.get('/tipo/:tipo', (req, res) => {
  let tipo = req.params.tipo;
  db.sequelize.query(`SELECT r.*, u.nombre nombre_creador , concat( r.nombre,' - ',  u.nombre) as label FROM rubricas as r 
  join usuarios as u
  on r.creador = u.correo WHERE r.tipo='${tipo}'`)
  .then(estudiantes => {
  res.send(estudiantes[0])
}).catch(err => {
  res.status(400).sendStatus({
    error: err
  })
})
});
//GET Rubrica by semestre
router.get('/tipo/:tipo/:creador', (req, res) => {
  let tipo = req.params.tipo;
  let creador = req.params.creador;
  db.sequelize.query(`SELECT r.*, u.nombre nombre_creador , concat( r.nombre,' - ',  u.nombre) as label FROM rubricas as r 
  join usuarios as u
  on r.creador = u.correo WHERE r.tipo='${tipo}' and r.creador='${creador}'`)
  .then(estudiantes => {
  res.send(estudiantes[0])
}).catch(err => {
  res.status(400).sendStatus({
    error: err
  })
})
});

router.post('/', (req, res) => {
  if (!req.body){
    return res.status(400).send({ success: false, message: "Bad Request", info: null })
  }else{
    Rubrica.create(req.body)
    .then(data=> {
      res.send(data)
    })
    .catch(err => {
      res.status(400).send({error: err })
    })  
  }
});
//PUT usuario
router.put('/:id',(req,res)=>{
  let id  = req.params.id;
  if (!req.body){
    return res.status(400).sendStatus({ success: false, message: "Bad Request", info: null })
  }else{
    Rubrica.update(req.body, {
      where: {id: id}
    })
    .then(() => {
      res.json({status: 'Rúbrica actualizado'})
    })
    .catch(err => {
      res.status(400).send({error: err })
    })  
  }
})
//DELETE usuario
router.delete('/:id', (req, res) => {
  let id = req.params.id;
  Rubrica.destroy({
    where: {id: id}
  })
  .then(()=>{
    res.send({info:'Rubrica Eliminada'})
  })
  .catch(err => {
    res.status(400).send({error: err })
  })  
});

module.exports = router