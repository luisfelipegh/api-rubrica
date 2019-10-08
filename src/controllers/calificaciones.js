var express = require('express')
var router = express.Router()
var Calificacion = require('../models/Calificacion')
const db = require('../db/db');
//GET Calificaciones
router.get('/', (req, res) => {
    Calificacion.findAll()
    .then(calificaciones => {
        res.send(calificaciones)
    })
    .catch(err => {
        res.status(400).sendStatus({error: err })
    })
});

router.get('/misCalificaciones/:correo/:grupo', (req, res) => {
  let correo = req.params.correo;
  let grupo = req.params.grupo;
  db.sequelize.query(`select to_char(i.fecha - interval '5 hours' , 'dd-MM-yyyy HH12:MI')fecha, i.nombre_grupo, i.grupo,i.correo,i.tipo ,i.nombre,i.equipo,i.actividad,i.profesor,i.correo_profesor,i.nota,i.calificado, rubrica rubrica
  from (
    select  json_array_elements(rubrica->'calificacion'->'estudiantesTeam')->>'correo' correo,
    json_array_elements(rubrica->'calificacion'->'estudiantesTeam')->>'nombre' nombre, 
    rubrica->'calificado'->>'nombre' equipo,* from (select c.fecha,g.nombre nombre_grupo, c.tipo,c.grupo,ac.nombre actividad, p.nombre profesor,
                            c.profesor correo_profesor,
    c.nota nota,c.calificado calificado,c.rubrica rubrica from calificaciones c
    join actividades ac
    on c.actividad = ac.id
    join usuarios p
    on c.profesor = p.correo
    join grupos g 
    on c.grupo = g.codigo
    where c.tipo='equipo')info
  )i
  where correo ='${correo}' and grupo='${grupo}'
  union all
  select to_char(c.fecha - interval '5 hours' , 'dd-MM-yyyy HH12:MI')fecha,g.nombre nombre_grupo,c.grupo,e.correo, c.tipo,e.nombre,'Individual' equipo,ac.nombre actividad, p.nombre profesor,c.profesor correo_profesor,
  c.nota nota,c.calificado calificado, c.rubrica from calificaciones c
  join actividades ac
  on c.actividad = ac.id
  join usuarios p
  on c.profesor = p.correo
  join usuarios e
  on c.calificado = e.correo
  join grupos g 
  on c.grupo = g.codigo
  where c.tipo='estudiante'and c.calificado ='${correo}' and c.grupo='${grupo}'`)
  .then(calificaciones => {
  res.send(calificaciones[0])
}).catch(err => {
  res.status(400).sendStatus({
    error: err
  })
})
});

//Get Calificaciones profesor
router.get('/:id', (req, res) => {
  let id = req.params.id;
  Calificacion.findOne({
    where:{
      id: id
    }
  })
  .then(calificacion => {
    res.send(calificacion)
  })
  .catch(err => {
    res.status(400).sendStatus({error: err })
  })
});


router.get('/grupo/:grupo', (req, res) => {
  let grupo = req.params.grupo;
  db.sequelize.query(`select to_char(i.fecha - interval '5 hours' , 'dd-MM-yyyy HH12:MI') fecha,i.id,i.tipo,i.equipo nombre,i.actividad,i.profesor,i.correo_profesor,i.nota,i.calificado, rubrica rubrica
  from (
    select  
    rubrica->'calificado'->>'nombre' equipo,* from (select c.fecha,c.id,c.tipo,ac.nombre actividad, p.nombre profesor,
                            c.profesor correo_profesor,
    c.nota nota,c.calificado calificado,c.rubrica rubrica from calificaciones c
    join actividades ac
    on c.actividad = ac.id
    join usuarios p
    on c.profesor = p.correo
    where c.tipo='equipo' and c.grupo='${grupo}')info
  )i
  
  union all
  select to_char(c.fecha - interval '5 hours' , 'dd-MM-yyyy HH12:MI')  fecha,c.id,c.tipo, e.nombre equipo,ac.nombre actividad, p.nombre profesor,c.profesor correo_profesor,
  c.nota nota,c.calificado calificado, c.rubrica from calificaciones c
  join actividades ac
  on c.actividad = ac.id
  join usuarios p
  on c.profesor = p.correo
  join usuarios e
  on c.calificado = e.correo
  where c.tipo='estudiante' and c.grupo='${grupo}'`)
  .then(calificaciones => {
  res.send(calificaciones[0])
}).catch(err => {
  res.status(400).sendStatus({
    error: err
  })
})
});

//Get Calificaciones profesor
router.get('/profesor/:profesor', (req, res) => {
  let pfsr = req.params.usuario;
  Calificacion.findAll({
    where:{
      profesor: pfsr
    }
  })
  .then(calificaciones => {
    res.send(calificaciones)
  })
  .catch(err => {
    res.status(400).sendStatus({error: err })
  })
});

//Get Calificaciones calificado
router.get('/calificado/:calificado', (req, res) => {
  let creator = req.params.usuario;
  Calificacion.findAll({
    where:{
      creador: creator
    }
  })
  .then(Calificaciones => {
    res.send(Calificaciones)
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
    Calificacion.create(req.body)
    .then(data=> {
      res.send(data)
    })
    .catch(err => {
      res.status(400).send({error: err })
    })  
  }
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
    Calificacion.update(req.body, {
        where: {
          id: id
        }
      })
      .then(() => {
        res.send({
          info: 'Calificacion Actualizado'
        })
      })
      .catch(err => {
        res.status(400).send({
          error: err
        })
      })
  }
})

//DELETE usuario
router.delete('/:id', (req, res) => {
  let id = req.params.id;
  Calificacion.destroy({
    where: {
        id: id,
    }
  })
  .then(()=>{
    res.send({info:'Calificacion Eliminada'})
  })
  .catch(err => {
    res.status(400).send({error: err })
  })  
});


module.exports = router