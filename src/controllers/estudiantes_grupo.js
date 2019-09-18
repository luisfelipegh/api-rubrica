var express = require('express')
var router = express.Router()
var estudiantesTeam = require('../models/Estudiantes_equipos')
const db = require('../db/db');


//GET estudiantes
router.get('/:team', (req, res) => {
  let equipo = parseInt(req.params.team);
  
  db.sequelize.query(`SELECT * FROM estudiantes_equipos as e
  join usuarios as es
  on e.estudiante = es.correo WHERE e.equipo=${equipo}`)
  .then(estudiantes => {
  res.send(estudiantes[0])
}).catch(err => {
  res.status(400).sendStatus({
    error: err
  })
})
});


//POST new usuario
router.post('/', (req, res) => {
  if (!req.body) {
    return res.status(400).sendStatus({
      success: false,
      message: "Bad Request",
      info: null
    })
  } else {
    estudiantesTeam.create(req.body)
      .then(data => {
        res.send(data)
      })
      .catch(err => {
        res.status(400).send({
          error: err
        })
      })
  }
});

//DELETE usuario
router.delete('/:grupo/:equipo/:correo', (req, res) => {
  let mail = req.params.correo;
  let grupo = req.params.grupo;
  let equipo = req.params.equipo;


  estudiantesTeam.destroy({
      where: {
        estudiante: mail,
        grupo: grupo,
        equipo: equipo
      }
    })
    .then(() => {
      res.send({
        info: 'usuario Eliminado'
      })
    })
    .catch(err => {
      res.status(400).send({
        error: err
      })
    })
});

//PUT usuario
router.put('/:correo', (req, res) => {
  let mail = req.params.correo;
  if (!req.body) {
    return res.status(400).sendStatus({
      success: false,
      message: "Bad Request",
      info: null
    })
  } else {
    Usuario.update(req.body, {
        where: {
          correo: mail
        }
      })
      .then(() => {
        res.json({
          status: 'Usuario actualizado'
        })
      })
      .catch(err => {
        res.status(400).send({
          error: err
        })
      })
  }
})

module.exports = router