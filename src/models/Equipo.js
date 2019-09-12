const Sequelize = require('sequelize');
const db = require('../db/db');

var Equipo = db.sequelize.define(
    'equipos',
    {
        id: {
            type: Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey: true 
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
        nombre:{
            type: Sequelize.STRING,
            allowNull: false,
        },
    },

    {timestamps: false}
)

module.exports = Equipo;
