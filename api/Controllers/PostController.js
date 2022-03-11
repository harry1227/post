const express = require("express");
const router = express.Router();
const func = require("../utils/util-functions");
const PostService = require("../Services/PostService");
const validateUser = require('../utils/validateUser')

// GET POST DETAILS

// curl --location --request GET 'localhost:5000/pnc/posts/getpostDetails/3/v1' \
// --header 'token: 88270e1b-96d4-4122-b19d-5fd6f15bc213' \
// --header 'Cookie: sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo'

router.get("/getpostDetails/:user_code/v1", validateUser(), function (req, res) {
  PostService.getPostDetails((err, response) => {
    if (err) {
      res.send(func.responseGenerator(func.msgCons.MSG_ERROR, func.msgCons.MSG_PNC_GET_POST_DETAILS_500 , true));
    } else {
      res.send(func.responseGenerator(func.msgCons.MSG_SUCCESS, func.msgCons.MSG_PNC_GET_POST_DETAILS_200 ,false, response));
    }
  });
});

// UPDATE AND INSERT POSTS DETAILS 

// FOR UPDATE SEND POST ID AND POST DATA

// curl --location --request POST 'localhost:5000/pnc/posts/upsertPostsDetails/1/v1' \
// --header 'Cookie: sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo' \
// --header 'token: 88270e1b-96d4-4122-b19d-5fd6f15bc213' \
// --header 'Content-Type: application/json' \
// --data-raw '{
//     "postId":4,
//     "postTitle":"HHP Tours and Travels",
//     "postDescription":"All about tours and travels"
// }
// '

// FOR INSERT SEND POST ID = 0

// curl --location --request POST 'localhost:5000/pnc/posts/upsertPostsDetails/1/v1' \
// --header 'Cookie: sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo' \
// --header 'token: 88270e1b-96d4-4122-b19d-5fd6f15bc213' \
// --header 'Content-Type: application/json' \
// --data-raw '{
//     "postId":0,
//     "postTitle":"HHP Tours and Travels",
//     "postDescription":"All about tours and travels"
// }
// '

router.post("/upsertPostsDetails/:user_code/v1", validateUser(), function (req, res) {
  let userCode = req.params[func.dbCons.FIELD_USER_CODE];
  PostService.upsertPostDetails(userCode, req.body, (err, response) => {
    if (err) {
      res.send(func.responseGenerator(func.msgCons.MSG_ERROR, func.msgCons.MSG_PNC_UPDATE_POSTS_500 , true));
    } else {
      res.send(func.responseGenerator(func.msgCons.MSG_SUCCESS, func.msgCons.MSG_PNC_UPDATE_POSTS_200 ,false, response));
    }
  });
});

// REMOVE POSTS

// curl --location --request GET 'localhost:5000/pnc/posts/removePosts/1/v1?postId=2' \
// --header 'Cookie: sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo' \
// --header 'token: 88270e1b-96d4-4122-b19d-5fd6f15bc213'

router.get("/removePosts/:user_code/v1", validateUser(), function (req, res) {
    let userCode = req.params[func.dbCons.FIELD_USER_CODE]
    PostService.removePosts(req.query, userCode, (err, response) => {
    if (err) {
      res.send(func.responseGenerator(func.msgCons.MSG_ERROR, func.msgCons.MSG_PNC_REMOVE_POSTS_500 , true));
    } else {
      res.send(func.responseGenerator(func.msgCons.MSG_SUCCESS, func.msgCons.MSG_PNC_REMOVE_POSTS_200 ,false, response));
    }
  });
});

module.exports = router;
