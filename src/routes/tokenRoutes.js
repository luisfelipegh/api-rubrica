const express = require("express");
const routes = express.Router();
routes.use(express.json());

routes.use("/usuarios", require("../controllers/usuarios"));
routes.use("/rubricas", require("../controllers/rubricas"));

module.exports = routes;
