const express = require("express");
const router = express.Router();
const func = require('../utils/util-functions')
const connection = require("../../config/connections");

module.exports = function validateUser() {
  return (req, res, next) => {
    let query = `CALL ${func.spCons.SP_AUTHENTICATE_LOGIN_V1}(${req.params[func.dbCons.FIELD_USER_CODE]}, '${req.headers[func.dbCons.FIELD_TOKEN]}')`;
    console.log(query);
    func.mysqlQuery(query, function (err, result) {
        if (err) {
            res.send(err);
        } else if (result[0].validation_message) {
            res.send(result)
        } else {
            next();   
        }
    });
  };
}
