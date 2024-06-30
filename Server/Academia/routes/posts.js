const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/Post');
const courseModel = require('../models/Course');
const userModel = require('../models/User');
const materialModel = require('../models/Material');
const coursePollModel = require('../models/CoursePoll');
const assignmentModel = require('../models/Assignment');
const statementModel = require('../models/Statement');
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
router.post("/", verifyToken.verifyToken, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

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
        const coursePoll = new coursePollModel.coursePoll(requestPost.coursePoll);
        await coursePoll.save();
        post.coursePoll = coursePoll;
    }
    if (requestPost.material && requestPost.material != {}) {
        // validate the request 
        const { error } = materialModel.validateCreateMaterial(requestPost.material);
        if (error) {
            return res.status(400).json({ error: error.details[0].message });
        }
        // add material to database
        const material = new materialModel.materialModel(requestPost.material);
        await material.save();
        post.material = material;
    }
    if (requestPost.assignment && requestPost.assignment != {}) {
        // validate the request 
        const { error } = assignmentModel.validateCreateAssignment(requestPost.assignment);
        if (error) {
            return res.status(400).json({ error: error.details[0].message });
        }
        // add assignment to database
        const assignment = new assignmentModel.assignmentModel(requestPost.assignment);
        await assignment.save();
        post.assignment = assignment;
    }
    if (requestPost.quiz && requestPost.quiz != {}) {
        // validate the request
        const { error } = quizModel.validateCreateQuiz(requestPost.quiz);
        if (error) {
            return res.status(400).json({ error: error.details[0].message });
        }

        // add quiz to database
        const quiz = new quizModel.quizModel(requestPost.quiz);
        await quiz.save();
        post.quiz = quiz;
    }


    // save post
    await post.save();

    // Add post to course
    course.posts.push(post.id);
    await course.save();

    await res.status(201).json(await functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createPostVerb,
        req.body.object.objectType,
        "Post Data",
        { post: post },
        post._id
    ));
}));

/**
 * @desc Get all posts
 * @route GET /api/posts
 * @method GET
 * @access Public
 */
/// Get All Posts
router.get("/", verifyToken.verifyToken, asyncHandler(async (req, res) => {
    const posts = await model.postModel.find();

    // get user data for each post
    for (let i = 0; i < posts.length; i++) {
        let user = await userModel.userModel.findById(posts[i].postedBy).select('-password');
        // Convert the Mongoose document to a plain object
        let postObject = posts[i].toObject();
        postObject.userData = user;
        // Replace the original document in the array with the modified object
        posts[i] = postObject;
    }

    res.status(200).json({ posts: posts });
}));

/**
 * @desc Get a post by ID
 * @route GET /api/posts/:id
 * @method GET
 * @access Public
 */
/// Get Post by ID
router.get(`/:id`, verifyToken.verifyToken, asyncHandler(async (req, res) => {
    let post = await model.postModel.findById(req.params.id);
    if (!post) {
        return res.status(404).json({ error: 'The post with the given ID was not found' });
    }

    // get user data for the post
    let user = await userModel.userModel.findById(post.postedBy).select('-password');
    // Convert the Mongoose document to a plain object
    let postObject = post.toObject();
    postObject.userData = user;
    // Replace the original document in the array with the modified object
    post = postObject;

    res.status(200).json({ post: post });
}));

/**
 * @desc Get all posts by course ID
 * @route GET /api/posts/course/:id
 * @method GET
 * @access Public
 */
/// Get All Posts by Course ID
router.get(`/course/:id`, verifyToken.verifyToken, asyncHandler(async (req, res) => {
    const posts = await model.postModel.find({ courseId: req.params.id });

    // get user data for each post
    for (let i = 0; i < posts.length; i++) {
        let user = await userModel.userModel.findById(posts[i].postedBy).select('-password');
        // Convert the Mongoose document to a plain object
        let postObject = posts[i].toObject();
        postObject.userData = user;
        // Replace the original document in the array with the modified object
        posts[i] = postObject;
    }

    res.status(200).json({ posts: posts });
}));

/**
 * @desc Update a post
 * @route PUT /api/posts/:id
 * @method PUT
 * @access Public
 */
/// Update Post
router.put(`/:id`, verifyToken.verifyToken, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

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
    await res.status(200).json(await functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updatePostVerb,
        req.body.object.objectType,
        "Post Data",
        { post: post },
        post._id
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
    await res.status(200).json(await functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.deletePostVerb,
        req.body.object.objectType,
        "Post Data",
        { post: post },
        post._id
    ));
}));


// search posts by description 
router.get('/search', verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    const posts = await model.postModel.find({ content: { $regex: req.query.content, $options: 'i' } });
    res.status(200).json(posts);
}));


module.exports = router;