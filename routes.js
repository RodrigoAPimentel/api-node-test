const { Router } = require("express");

const routes = Router();

routes.get("/", (req, res) => {
  res.status(200).send("<h1>Page /</h1>");
});

routes.get("/test1", (req, res) => {
  res.status(200).send("<h1>Page Test 1</h1>");
});

routes.post("/test2", (req, res) => {
  res.status(200).send("<h1>Page Test 2</h1>");
});

module.exports = routes;
