const express = require("express");
const routes = express.Router();
routes.use(express.json());

routes.use("/usuarios", require("../controllers/usuarios"));
routes.use("/rubricas", require("../controllers/rubricas"));
routes.use("/grupos", require("../controllers/grupos"));
routes.use("/equipos", require("../controllers/equipos"));
routes.use("/upload", require("../controllers/upload"));
routes.use("/estudiantesTeam", require("../controllers/estudiantes_grupo"));


module.exports = routes;
