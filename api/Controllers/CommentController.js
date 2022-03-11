const express = require("express");
const router = express.Router();
const func = require("../utils/util-functions");
const CommentService = require("../Services/CommentService");
const validateUser = require('../utils/validateUser')

// GET COMMENT DETAILS

// curl --location --request GET 'localhost:5000/pnc/comments/getCommentDetails/1/v1?postId=1' \
// --header 'Cookie: sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo' \
// --header 'token:  88270e1b-96d4-4122-b19d-5fd6f15bc213'

router.get("/getCommentDetails/:user_code/v1", validateUser(), function (req, res) {
  let postId = req.query[func.dbCons.FIELD_POST_ID];
  CommentService.getCommentDetails(postId, (err, response) => {
    if (err) {
      res.send(func.responseGenerator(func.msgCons.MSG_ERROR, func.msgCons.MSG_PNC_GET_COMMENT_DETAILS_500 , true));
    } else {
      res.send(func.responseGenerator(func.msgCons.MSG_SUCCESS, func.msgCons.MSG_PNC_GET_COMMENT_DETAILS_200 ,false, response));
    }
  });
});

// UPDATE COMMENTS

// curl --location --request PUT 'localhost:5000/pnc/comments/updateComment/3/v1' \
// --header 'Cookie: sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo' \
// --header 'Content-Type: application/json' \
// --header 'token:  88270e1b-96d4-4122-b19d-5fd6f15bc213' \
// --data-raw '{
//     "postId":4,
//     "commentId":1,
//     "comment":"Nice Article"
// }
// '

router.post("/updateComment/:user_code/v1", validateUser(), function (req, res) {
    let userCode = req.params[func.dbCons.FIELD_USER_CODE]
  CommentService.updateComment(req.body, userCode, (err, response) => {
    if (err) {
      res.send(func.responseGenerator(func.msgCons.MSG_ERROR, func.msgCons.MSG_PNC_UPDATE_COMMENT_500 , true));
    } else {
      res.send(func.responseGenerator(func.msgCons.MSG_SUCCESS, func.msgCons.MSG_PNC_UPDATE_COMMENT_200 ,false, response));
    }
  });
});

// REMOVE COMMENTS

// curl --location --request PUT 'localhost:5000/pnc/comments/removeComment/3/v1?postId=1&commentId=2' \
// --header 'Cookie: sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo' \
// --header 'token: 88270e1b-96d4-4122-b19d-5fd6f15bc213'

router.put("/removeComment/:user_code/v1", validateUser(), function (req, res) {
    let userCode = req.params[func.dbCons.FIELD_USER_CODE]
  CommentService.removeComment(req.query, userCode, (err, response) => {
    if (err) {
      res.send(func.responseGenerator(func.msgCons.MSG_ERROR, func.msgCons.MSG_PNC_REMOVE_COMMENT_500 , true));
    } else {
      res.send(func.responseGenerator(func.msgCons.MSG_SUCCESS, func.msgCons.MSG_PNC_REMOVE_COMMENT_200 ,false, response));
    }
  });
});

module.exports = router;
