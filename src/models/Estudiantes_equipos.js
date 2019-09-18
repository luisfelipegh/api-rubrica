const Sequelize = require('sequelize');
const db = require('../db/db');

var EstudianteTeam = db.sequelize.define(
    'estudiantes_equipos',
    {
        equipo: {
            primaryKey: true ,

            type: Sequelize.INTEGER,
            references: {
                model: "Equipo",
                key: "codigo",
            },
        },
        grupo:{
            primaryKey: true ,

            type: Sequelize.STRING,
            allowNull: false,
            references: {
                model: "Equipo",
                key: "grupo",
            },
        },
        estudiante:{
            primaryKey: true ,

            type: Sequelize.STRING,
            references: {
                model: "Usuario",
                key: "correo"
              },
            allowNull: false,
        },
    },

    {timestamps: false}
)

module.exports = EstudianteTeam;
