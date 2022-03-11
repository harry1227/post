const express = require("express");
const router = express.Router();
const connection = require("../../config/connections");

module.exports = {
  dbCons: require('../utils/constants/db-constant'),
  spCons: require('../utils/constants/sp-constant'),
  msgCons: require('../utils/constants/msg-constant'),
  mysqlQuery: function (query, callback) {
    connection.query(query, function (_err, result) {
        let results = result[0] && result[0].length > 0 ? JSON.parse(JSON.stringify(result)) : result
      if (result[0] && result[0].length > 0) {
        callback(null, results[0])
      } else if (results.affectedRows > 0) {
        callback(null, results);
      } else if (result[0] && result[0].length == 0) {
        callback(null, results);
      }
    });
  },
  responseGenerator: function (msg, code, isError, data) {
    var responseJson = {};
    responseJson['error_status'] = (isError) ? true : false;
    responseJson['code'] = (code) ? code : (isError) ? this.msgCons.MSG_ERROR : this.msgCons.MSG_SUCCESS;
    responseJson['msg'] = (msg) ? msg : (isError) ? this.msgCons.MSG_ERROR : this.msgCons.MSG_SUCCESS;
    if (data && data.length !== 0) {
      responseJson['data'] = data;
    }
    return responseJson;
  }
};
