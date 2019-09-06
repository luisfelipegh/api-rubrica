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
    res.json({satatus:'Usuario Eliminado'})
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