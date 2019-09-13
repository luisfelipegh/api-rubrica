const Sequelize =  require('sequelize');
const db  = {}
const sequelize = new Sequelize('rubrica','postgres','admin',{
    host:'localhost',
    port: 5432,
    dialect: 'postgres',
    operatorAliases: false,
    pool:{
        max:5,
        min:0,
        acquaire:30000,
        idle:10000,
    }
})

// sequelize.authenticate().then(() => {
//     console.log("Success!");
//   }).catch((err) => {
//     console.log(err);
//   });

db.sequelize = sequelize
db.Sequelize = Sequelize

module.exports = db