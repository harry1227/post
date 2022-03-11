const express = require("express");
const router = express.Router();
const func = require("../utils/util-functions");
const uuid = require('node-uuid')

module.exports = {
  upsertUserDetails: function (reqBody, callback) {
    var query = `CALL ${func.spCons.SP_UPSERT_USER_DETAILS_V1}(${reqBody.userCode}, '${reqBody.userName}', '${reqBody.loginName}', '${reqBody.userPassword}', ${reqBody.isActive})`;
    console.log(query);
    func.mysqlQuery(query, function (err, result) {
      if (err) {
        callback(err);
      } else {
        callback(null, result);
      }
    });
  },
  login: function (reqBody, callback) {
    let token = uuid.v4();
    var query = `CALL ${func.spCons.SP_USER_AUTHENTICATION_V1}('${reqBody.loginName}', '${reqBody.userPassword}', '${token}')`;
    console.log(query);
    func.mysqlQuery(query, function (err, result) {
      if (err) {
        callback(err);
      } else {
        callback(null, result);
      }
    });
  },
};
