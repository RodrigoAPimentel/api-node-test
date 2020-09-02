const dotenv = require("dotenv").config();

const express = require("express");
const bodyParser = require("body-parser");
const morgan = require("morgan");
const cors = require("cors");

const router = require("./routes");

class App {
  constructor() {
    this.app = express();

    this.middlewares();
    this.routes();
    this.server();
  }

  routes() {
    this.app.use("/", router);

    this.app.use((req, res) =>
      res.status(404).send("<h1>404 - Not Found</h1>")
    );
    this.app.use((err, req, res) => {
      debug(err.stack);
      res.status(500).send("<h1>500 - Internal Server Error</h1>");
    });
  }

  middlewares() {
    this.app.use(morgan("combined"));

    this.app.use(bodyParser.json());
    this.app.use(bodyParser.urlencoded({ extended: false }));

    this.app.use(cors());
  }

  server() {
    this.app.listen(process.env.APP_PORT, () => {
      console.log(
        `App started on ${process.env.APP_URL}:${process.env.APP_PORT} [${process.env.NODE_ENV}]; press Ctrl-C to terminate.`
      );
    });
  }
}

module.exports = new App();
