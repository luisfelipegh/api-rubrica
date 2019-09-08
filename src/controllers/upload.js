
var express = require('express')
var router = express.Router()
const filer = require("../core/files").Reader(console);

router.post('/', (req, res) => {
    if (!req.body){
      return res.status(400).send({ success: false, message: "Bad Request", info: null })
    }else{
      filer.insertInDatabase(req.body)
      .then(data=> {
        res.send(data)
      })
      .catch(err => {
        res.status(400).send({error: err })
      })  
    }
  });
  
  module.exports = router