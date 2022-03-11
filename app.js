const express = require("express");
const app = express();
const connection = require("./config/connections");
var bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use("/", require("./routes/routing"));

var server = app.listen(5000, function (_err, result) {
  if (_err) {
    console.log("server not responding", _err);
  } else {
    var port = server.address().port;
    console.log("server running at port: " + port);
  }
});
