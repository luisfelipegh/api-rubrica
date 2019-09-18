
var express = require('express')
var router = express.Router()
const filer = require("../core/files").Reader(console);

router.post('/grupos', (req, res) => {
  if (!req.body){
    return res.status(400).send({ success: false, message: "Bad Request", info: null })
  }else{
    filer.insertInDatabaseGrupos(req.body)
    .then(data=> {
      console.log(data);
      
      res.send(data)
    })
    .catch(err => {
      console.log(err);
      
      res.status(400).send({error: err })
    })  
  }
});

router.post('/usuarios', (req, res) => {
  if (!req.body){
    return res.status(400).send({ success: false, message: "Bad Request", info: null })
  }else{
    filer.insertInDatabaseUsuarios(req.body)
    .then(data=> {
      res.send(data)
    })
    .catch(err => {
      res.status(400).send({error: err })
    })  
  }
});

  module.exports = router