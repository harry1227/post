const express = require("express");
const router = express.Router();
const func = require("../utils/util-functions");

module.exports = {
  getCommentDetails: function (postId, callback) {
    var query = `CALL ${func.spCons.SP_GET_COMMENT_DETAILS_V1}(${postId})`;
    func.mysqlQuery(query, function (err, result) {
      if (err) {
        callback(err);
      } else {
        callback(null, result);
      }
    });
  },
  removeComment: function (reqQuery, userCode, callback) {
    var query = `CALL ${func.spCons.SP_REMOVE_COMMENT_V1}(${reqQuery.postId}, ${reqQuery.commentId}, ${userCode})`;
    func.mysqlQuery(query, function (err, result) {
      if (err) {
        callback(err);
      } else {
        callback(null, result);
      }
    });
  },
  updateComment: function (reqBody, userCode, callback) {
    var query = `CALL ${func.spCons.SP_UPDATE_COMMENT_V1}(${reqBody.postId}, ${reqBody.commentId}, '${reqBody.comment}', ${userCode})`;
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
