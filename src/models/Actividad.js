const Sequelize = require('sequelize');
const db = require('../db/db');

var Actividad = db.sequelize.define(
    'actividades',
    {
      
        nombre:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        rubrica:{
            type: Sequelize.STRING,
            allowNull: false,
            references: {
                model: "Rubrica",
                key: "id",
            },
        },
        creador:{
            type: Sequelize.STRING,
            allowNull: false,
            references: {
                model: "Usuario",
                key: "correo",
            },
        },
    },

    {timestamps: false}
)

module.exports = Actividad;
