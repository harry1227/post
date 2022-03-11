const express = require("express");
const router = express.Router();
const func = require("../utils/util-functions");
const AuthService = require("../Services/AuthService");


// FOR INSERT USER

// curl --location --request PUT 'localhost:5000/pnc/auth/upsertUserDetails/v1' \
// --header 'Cookie: sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo' \
// --header 'Content-Type: application/json' \
// --header 'token: 88270e1b-96d4-4122-b19d-5fd6f15bc213' \
// --data-raw '{
//     "userCode":0,
//     "userName":"hardik jaiswal",
//     "loginName": "HJ",
//     "userPassword": "HJ@12",
//     "isActive":1
// }
// '

// FOR UPDATE USER

// curl --location --request PUT 'localhost:5000/pnc/auth/upsertUserDetails/v1' \
// --header 'Cookie: sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo' \
// --header 'Content-Type: application/json' \
// --header 'token: 88270e1b-96d4-4122-b19d-5fd6f15bc213' \
// --data-raw '{
//     "userCode":2,
//     "userName":"hardik jaiswal",
//     "loginName": "HJ",
//     "userPassword": "HJ@12",
//     "isActive":1
// }
// '

router.put("/upsertUserDetails/v1", function (req, res) {
    AuthService.upsertUserDetails(req.body, (err, response) => {
    if (err) {
      res.send(func.responseGenerator(func.msgCons.MSG_ERROR, func.msgCons.MSG_PNC_USER_UPDATE_500 ,true));
    } else {
      res.send(func.responseGenerator(func.msgCons.MSG_SUCCESS, func.msgCons.MSG_PNC_USER_UPDATE_200 ,false,response));
    }
  });
});

// curl --location --request POST 'localhost:5000/pnc/auth/login/v1' \
// --header 'Cookie: sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo; sails.sid=s%3ArqCp3CjEm3NBj9FwVozZEztEd7Bp80_Z.HeBgayegpRetJPCawQP6C%2Bb4W2ZMmiRNVboLBVlp%2BFo' \
// --header 'Content-Type: application/json' \
// --data-raw '{
//     "loginName": "HJ",
//     "userPassword": "HJ@12"
// }
// '

router.post("/login/v1", function (req, res) {
    AuthService.login(req.body, (err, response) => {
    if (err) {
      res.send(func.responseGenerator(func.msgCons.MSG_ERROR, func.msgCons.MSG_PNC_USER_LOGIN_500 ,true));
    } else {
      res.send(func.responseGenerator(func.msgCons.MSG_SUCCESS, func.msgCons.MSG_PNC_USER_LOGIN_200 ,false, response));
    }
  });
});

module.exports = router;

