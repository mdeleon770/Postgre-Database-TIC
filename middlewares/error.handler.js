const express = require("express");
const Routes = require("../routes");
const {
  logErrors,
  errorHandler,
  boomErrorHandler,
} = require("./middlewares/error.handler.js");
const app = express();
const port = 3000;

app.use(express.json());

app.listen(port, () => console.log(`Example app listening on port ${port}!`));

app.use("/api/v1");

app.use(logErrors);
app.use(boomErrorHandler);
app.use(errorHandler);
