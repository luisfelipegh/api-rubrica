const Sequelize = require('sequelize');
const db = require('../db/db');

var Rubrica = db.sequelize.define(
    'rubricas',
    {
        id: {
            type: Sequelize.INTEGER,
            autoIncrement: true,
            primaryKey: true
        },
        json:{
            type: Sequelize.JSONB,
            allowNull: false,
        },
        nombre:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        tipo:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        creador:{
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

module.exports = Rubrica;
