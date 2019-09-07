const express = require("express");
const routes = express.Router();
routes.use(express.json());


routes.use("/login", require("../controllers/login"));

module.exports = routes;
