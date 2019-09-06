const Sequelize = require('sequelize');
const db = require('../db/db');

var Usuario = db.sequelize.define(
    'usuarios',
    {
        correo:{
            type: Sequelize.STRING,
            primaryKey: true ,
            allowNull: false,
        },
        contrasena:{
            type: Sequelize.STRING,
            allowNull: false,
        },
        nombre:{
            type: Sequelize.STRING,
            allowNull: false,
        },
    },

    {timestamps: false}
)

module.exports = Usuario;

//PROPETIES OF A COLUMN  
// type: Sequelize.DATE STRING TEXT INTEGER,
// primaryKey: true / false,
// autoIncrement: true / false,
// allowNull: true / false,
// unique: true / false,  
// defaultValue: true / false / 0 / Sequelize.NOW,


//FORENG KEY EXAMPLE
// var Person = sequelize.define('Person', {

//     name: Sequelize.STRING
// });

// var Father = sequelize.define('Father', {

//     age: Sequelize.STRING,
//     //The magic start here
//     personId: {
//           type: Sequelize.INTEGER,
//           references: 'persons', // <<< Note, its table's name, not object name
//           referencesKey: 'id' // <<< Note, its a column name
//     }
// });

// Person.hasMany(Father); // Set one to many relationship
//OTHER EXAMPLE User.belongsTo(Company, {foreignKey: 'fk_company'});