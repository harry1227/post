const mysql = require("mysql");

const config = mysql.createPool({
  connectionLimit: 10,
  host: "localhost",
  port:3306,
  user: "root",
  password: "H@rdik@123",
  database: "posts",
});

config.getConnection((Error, connection) => {
  if (Error) console.log(Error);
  console.log("Connection Established");
});

module.exports = config;
