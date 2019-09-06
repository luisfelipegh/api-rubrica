const postgres = require('pg');
const poolDev  = postgres.createPool({
  connectionLimit : 20,
  host            : 'localhost',
  port            : '5432',
  user            : 'admin',
  password        : 'admin',
  database        : "rubrica"
});
module.exports = poolDev;