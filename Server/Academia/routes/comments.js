const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/Comment');
const statementModel = require('../models/Statement');
const postModel = require('../models/Post');
const functions = require('../utilities/functions');
const verifyToken = require('../middlewares/verifyToken');

/**
 * @desc Create a comment
 * @route POST /api/comments
 * @method POST
 * @access Public
 */
/// Create Comment
router.post("/", verifyToken.verifyToken, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    //  validate the comment data
    requestComment = req.body.context.comment;
    if (!requestComment) {
        return res.status(400).json({ error: 'Comment Data is Required.' });
    }

    // validate the request
    const { error } = model.validateCreateComment(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // check if post exists
    let post = await postModel.postModel.findById(requestComment.postId);
    if (!post) {
        return res.status(400).json({ error: 'The post with the given ID was not found' });
    }

    // create comment
    const comment = new model.commentModel(requestComment);

    // save comment
    await comment.save();

    // Add comment to post
    post.comments.push(comment.id);

    // Remove _id and password from response
    const { _id, password, ...commentData } = comment._doc;
    await res.status(201).json(await functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createCommentVerb,
        req.body.object.objectType,
        "Comment Data",
        { comment: commentData },
        comment._id
    ));
}));

/**
 * @desc Get all comments
 * @route GET /api/comments
 * @method GET
 * @access Public
 */
/// Get All Comments
router.get("/", verifyToken.verifyToken, asyncHandler(async (req, res) => {
    const comments = await model.commentModel.find();
    res.status(200).json(comments);
}));

/**
 * @desc Get a comment by ID
 * @route GET /api/comments/:id
 * @method GET
 * @access Public
 */
/// Get Comment by ID
router.get(`/:id`, verifyToken.verifyToken, asyncHandler(async (req, res) => {
    const comment = await model.commentModel.findById(req.params.id);
    if (!comment) {
        return res.status(404).json({ error: 'The comment with the given ID was not found' });
    }
    res.status(200).json(comment);
}));

/**
 * @desc Update a comment
 * @route PUT /api/comments/:id
 * @method PUT
 * @access Public
 */
/// Update Comment
router.put(`/:id`, verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    //  validate the comment data
    requestComment = req.body.context.comment;
    if (!requestComment) {
        return res.status(400).json({ error: 'Comment Data is Required.' });
    }

    // validate the request
    const { error } = model.validateUpdateComment(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // update comment
    const comment = await model.commentModel.findByIdAndUpdate(req.params.id, {
        content: requestComment.content,
        likes: requestComment.likes,
        dislikes: requestComment.dislikes
    }, { new: true });// remove _id from response
    if (!comment) {
        return res.status(404).json({ error: 'The comment with the given ID was not found' });
    }
    await res.status(200).json(await functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updateCommentVerb,
        req.body.object.objectType,
        "Comment Data",
        { comment: comment },
        comment._id
    ));
}));

/**
 * @desc Delete a comment
 * @route DELETE /api/comments/:id
 * @method DELETE
 * @access Public
 */
/// Delete Comment
router.delete(`/:id`, verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    const comment = await model.commentModel.findByIdAndDelete(req.params.id);
    if (!comment) {
        return res.status(404).json({ error: 'The comment with the given ID was not found' });
    }
    await res.status(200).json(await functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.deleteCommentVerb,
        req.body.object.objectType,
        "Comment Data",
        { comment: comment },
        comment._id
    ));
}));

module.exports = router;