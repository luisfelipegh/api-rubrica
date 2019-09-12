var express = require('express')
var router = express.Router()
var Grupos = require('../models/Grupo')
var Estudiantes = require('../models/Estudiante')
var Usuario = require('../models/Usuario')

//GET grupos
router.get('/', (req, res) => {
  Grupos.findAll()
  .then(grupos => {
    res.send(grupos)
  })
  .catch(err => {
    res.status(400).sendStatus({error: err })
  })
});

//GET by id
router.get('/:id', (req, res) => {
  let id = req.params.id;
  Grupos.findOne({
    where:{
      id: id
    }
  })
  .then(grupo =>{
    if(grupo){
      res.send(grupo)
    }else{
      res.status(400).sendStatus({error: 'Grupo invalido' })
    }
  })
  .catch(err => {
    res.status(400).sendStatus({error: err })
  })  
});

//GET estudiantes 
router.get('/estudiantes/:id', (req, res) => {
  let id = req.params.id;
  Grupos.findOne({
    where:{
      id: id
    }
  })
  .then(grupo =>{
    if(grupo){
      console.log(grupo.codigo,grupo.semestre)
      Estudiantes.findAll({
        where:{
          grupo: grupo.codigo,
          semestre:  parseInt(grupo.semestre)
        }
      })
      .then(estudiantes => {
        res.send(estudiantes)
      })
      .catch(err => {
        res.status(400).sendStatus({error: err })
      })

    }else{
      res.status(400).sendStatus({error: 'Grupo invalido' })
    }
  })
  .catch(err => {
    res.status(400).sendStatus({error: err })
  })  
});

//GET grupos profesor  
router.get('/profesor/:correo', (req, res) => {
  let correo = req.params.correo;
  Grupos.findAll({
    where:{
      profesor : correo
    }
  })
  .then(grupos =>{
    if(grupos){
      res.send(grupos)
    }else{
      res.status(400).sendStatus({error: 'Grupo invalido' })
    }
  })
  .catch(err => {
    res.status(400).sendStatus({error: err })
  })  
});

//POST one Grupo
router.post('/', (req, res) => {
  if (!req.body){
    return res.status(400).sendStatus({ success: false, message: "Bad Request", info: null })
  }else{
    Grupos.create(req.body)
    .then(data=> {
      res.send(data)
    })
    .catch(err => {
      res.status(400).send({error: err })
    })  
  }
});

//DELETE Grupo
router.delete('/:id', (req, res) => {
  let id = req.params.id;
  Grupos.destroy({
    where: {id: id}
  })
  .then(()=>{
    res.send({info:'Grupo Eliminado'})
  })
  .catch(err => {
    res.status(400).send({error: err })
  })  
});

//PUT Grupo
router.put('/:id',(req,res)=>{
  let id  = req.params.id;
  if (!req.body){
    return res.status(400).sendStatus({ success: false, message: "Bad Request", info: null })
  }else{
    Grupos.update(req.body, {
      where: {id: id}
    })
    .then(() => {
      res.send({info:'Grupo Actualizado'})
    })
    .catch(err => {
      res.status(400).send({error: err })
    })  
  }
})




////--------------------------------------------------------------------
//WITHOUT SEQUELIZE
// //GET usuario by Id
// router.get('/:identificacion', (req, res) => {
//   let identificacion = req.params.identificacion;
//   let usuario = new Usuario();
//   usuario.selectUsuarioId(identificacion, (response) => {
//     return res.status(response.status).send(response.response);
//   });
// });

// //GET usuarios
// router.get('/', (req, res) => {
//   let usuario = new Usuario();
//   usuario.selectUsuarios((response) => {
//     return res.status(response.status).send(response.response);
//   });
// });

// //POST new usuario
// router.post('/', (req, res) => {
//   if (!req.body)
//     return res.status(400).sendStatus({ success: false, message: "Bad Request", info: null })
//   let data = req.body;
//   let usuario = new Usuario();
//   usuario.insertUsuario(data, (response) => {
//     return res.status(response.status).send(response.response);
//   });
// });

// //PUT usuario
// router.put('/:identificacion', (req, res) => {
//   if (!req.body)
//     return res.status(400).sendStatus({ success: false, message: "Bad Request", info: null })
//   let identificacion = req.params.identificacion;
//   let data = req.body;
//   let usuario = new Usuario();
//   usuario.updateUsuario(identificacion, data, (response) => {
//     return res.status(response.status).send(response.response);
//   });
// });

// //DELETE usuario
// router.delete('/:identificacion', (req, res) => {
//   if (!req.body)
//     return res.status(400).sendStatus({ success: false, message: "Bad Request", info: null })
//   let identificacion = req.params.identificacion;
//   let usuario = new Usuario();
//   usuario.deleteUsuario(identificacion, (response) => {
//     return res.status(response.status).send(response.response);
//   });
// });

module.exports = router