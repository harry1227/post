const express = require("express");
const router = express.Router();
const func = require("../utils/util-functions");

module.exports = {
  getPostDetails: function (callback) {
    let query = `CALL ${func.spCons.SP_GET_POST_DETAILS_V1}`;
    func.mysqlQuery(query, function (err, result) {
      if (err) {
        callback(err);
      } else {
        result.forEach((element) => {
          for (const key in element) {
            if (key.includes(func.dbCons.FIELD_COMMENTS)) {
              element[key] = JSON.parse(element[key]);
            }
          }
        });
        callback(null, result);
      }
    });
  },
  upsertPostDetails: function (userCode, reqBody, callback) {
    var query = `CALL ${func.spCons.SP_POST_DETAILS_UPSERT_V1}(${reqBody.postId}, '${reqBody.postTitle}', '${reqBody.postDescription}', ${userCode})`;
    func.mysqlQuery(query, function (err, result) {
      if (err) {
        callback(err);
      } else {
        callback(null, result);
      }
    });
  },
  removePosts: function (reqQuery, userCode, callback) {
    var query = `CALL ${func.spCons.SP_REMOVE_POSTS_V1}(${reqQuery.postId}, ${userCode})`;
    func.mysqlQuery(query, function (err, result) {
      if (err) {
        callback(err);
      } else {
        callback(null, result);
      }
    });
  },
};
