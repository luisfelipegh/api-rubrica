const Sequelize = require('sequelize');
const db = require('../db/db');

var Estudiante = db.sequelize.define(
    'grupos_estudiantes',
    {
        id: {
            type: Sequelize.INTEGER,
            autoIncrement: true,
        },
        grupo:{
            primaryKey: true ,
            type: Sequelize.STRING,
            allowNull: false,
            references: {
                model: "Grupo",
                key: "codigo",
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

module.exports = Estudiante;
