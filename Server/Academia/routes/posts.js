const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/Post');
const courseModel = require('../models/Course');
const materialModel = require('../models/Material');
const coursePollModel = require('../models/CoursePoll');
const assignmentModel = require('../models/Assignment');
const quizModel = require('../models/Quiz');
const verifyToken = require('../middlewares/verifyToken');
const functions = require('../utilities/functions');

/**
 * @desc Create a post
 * @route POST /api/posts
 * @method POST
 * @access Public
 */
/// Create Post
router.post("/", verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {

    // validate the post
    const requestPost = req.body.context.post;
    if (!requestPost) {
        return res.status(400).json({ error: 'The post is required.' });
    }

    // validate the request
    const { error } = model.validateCreatePost(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    console.log("Passed validation");
    // check if course exists
    let course = await courseModel.courseModel.findById(requestPost.courseId);
    if (!course) {
        return res.status(400).json({ error: 'The course with the given ID was not found' });
    }

    // create post
    const post = new model.postModel(requestPost);

    // check if post contains poll
    if (requestPost.coursePoll && requestPost.coursePoll != {}) {
        // validate the request 
        const { error } = coursePollModel.validateCreateCoursePoll(requestPost.coursePoll);
        if (error) {
            return res.status(400).json({ error: error.details[0].message });
        }
        // add poll to database
        const coursePoll = await model.coursePoll.create(requestPost.coursePoll);
    }
    if (requestPost.material && requestPost.material != {}) {
        // validate the request 
        const { error } = materialModel.validateCreateMaterial(requestPost.material);
        if (error) {
            return res.status(400).json({ error: error.details[0].message });
        }
        // add material to database
        const material = await materialModel.materialModel.create(requestPost.material);
    }
    if (requestPost.assignment && requestPost.assignment != {}) {
        // validate the request 
        const { error } = assignmentModel.validateCreateAssignment(requestPost.assignment);
        if (error) {
            return res.status(400).json({ error: error.details[0].message });
        }
        // add assignment to database
        const assignment = await assignmentModel.assignmentModel.create(requestPost.assignment);
    }
    if (requestPost.quiz && requestPost.quiz != {}) {
        // validate the request
        const { error } = quizModel.validateCreateQuiz(requestPost.quiz);
        if (error) {
            return res.status(400).json({ error: error.details[0].message });
        }
        // add quiz to database
        const quiz = await quizModel.quizModel.create(requestPost.quiz);
    }


    // save post
    await post.save();

    // Add post to course
    course.posts.push(post.id);
    await course.save();

    res.status(201).json(functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createPostVerb,
        req.body.object.objectType,
        "Post Data",
        { post: post },
    ));
}));

/**
 * @desc Get all posts
 * @route GET /api/posts
 * @method GET
 * @access Public
 */
/// Get All Posts
router.get("/", verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    const posts = await model.postModel.find();
    res.status(200).json(posts);
}));

/**
 * @desc Get a post by ID
 * @route GET /api/posts/:id
 * @method GET
 * @access Public
 */
/// Get Post by ID
router.get(`/:id`, verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    const post = await model.postModel.findById(req.params.id);
    if (!post) {
        return res.status(404).json({ error: 'The post with the given ID was not found' });
    }
    res.status(200).json(post);
}));

/**
 * @desc Update a post
 * @route PUT /api/posts/:id
 * @method PUT
 * @access Public
 */
/// Update Post
router.put(`/:id`, verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {

    //  validate the post data
    const requestPost = req.body.context.post;
    if (!requestPost) {
        return res.status(400).json({ error: 'The post is required.' });
    }

    // validate the request
    const { error } = model.validateUpdatePost(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // update post
    const post = await model.postModel.findByIdAndUpdate(req.params.id,
        {
            content: requestPost.content,
            likes: requestPost.likes,
            dislikes: requestPost.dislikes,
            comments: requestPost.comments
        },
        { new: true });

    // save post
    await post.save();
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updatePostVerb,
        req.body.object.objectType,
        "Post Data",
        { post: post },
    ));
}));

/**
 * @desc Delete a post
 * @route DELETE /api/posts/:id
 * @method DELETE
 * @access Public
 */
/// Delete Post
router.delete(`/:id`, verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const post = await model.postModel.findByIdAndDelete(req.params.id);
    if (!post) {
        return res.status(404).json({ error: 'The post with the given ID was not found' });
    }
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.deletePostVerb,
        req.body.object.objectType,
        "Post Data",
        { post: post }
    ));
}));


// search posts by description 
router.get('/search', verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    const posts = await model.postModel.find({ content: { $regex: req.query.content, $options: 'i' } });
    res.status(200).json(posts);
}));


module.exports = router;