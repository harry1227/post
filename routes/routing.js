const express = require('express')
const router = express.Router()

// POSTS API
router.use('/pnc/posts', require('../api/Controllers/PostController'))

// COMMENTS API
router.use('/pnc/comments', require('../api/Controllers/CommentController'))

// AUTH API
router.use('/pnc/auth', require('../api/Controllers/AuthController'))


module.exports = router
