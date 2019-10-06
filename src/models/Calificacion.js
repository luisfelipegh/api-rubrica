const Sequelize = require('sequelize');
const db = require('../db/db');

var Calificacion = db.sequelize.define(
    'calificaciones',
    {
        actividad:{
            type: Sequelize.INTEGER,
            allowNull: false,
            references: {
                model: "Actividad",
                key: "id",
            },
        },
        tipo:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        nota:{
            type: Sequelize.FLOAT,
            allowNull: false,
        },
        grupo:{
            primaryKey: false ,
            type: Sequelize.STRING,
            allowNull: false,
            references: {
                model: "Grupo",
                key: "codigo",
            },
        },
        calificado:{
            type: Sequelize.STRING,
            allowNull: false,
            references: {
                model: "Estudiante",
                key: "estudiante",
            },
        },
        profesor:{
            type: Sequelize.STRING,
            allowNull: false,
            references: {
                model: "Usuario",
                key: "correo",
            },
        },
        rubrica:{
            type: Sequelize.JSONB,
            allowNull: false,
        },
    },

    {timestamps: false}
)

module.exports = Calificacion;
