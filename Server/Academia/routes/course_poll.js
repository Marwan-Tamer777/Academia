const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/CoursePoll');
const course = require('../models/Course');
const functions = require('../utilities/functions');
const { verifyToken, verifyTokenAndAuthorization, verifyTokenAndAdmin, } = require('../middlewares/verifyToken');


/** 
    * @desc get all course polls 
    * @route GET /api/course_polls 
    * @method GET 
    * @access Private
*/
router.get('/', verifyToken, asyncHandler(async (req, res) => {
    const coursePolls = await model.coursePoll.find();
    res.status(200).json(coursePolls);
}));


/** 
    * @desc get a course poll by id 
    * @route GET /api/course_polls/:id 
    * @method GET 
    * @access Private
*/
router.get('/:id', verifyToken, asyncHandler(async (req, res) => {
    const coursePoll = await model.coursePoll.findById(req.params.id);
    if (coursePoll) {
        res.status(200).json(coursePoll);
    } else {
        res.status(404).json({ message: 'Course Poll not found' });
    }
}));


/**
    * @desc create a course poll 
    * @route POST /api/course_polls 
    * @method POST 
    * @access Private 
 */
router.post('/', verifyTokenAndAdmin, asyncHandler(async (req, res) => {

    // validate the request 
    const coursePollRequest = req.body.context.coursePoll;
    if (!coursePollRequest) {
        return res.status(400).json({ message: 'Course Poll is required' });
    }

    // validate the course exists 
    const isCourse = await course.courseModel.findById(coursePollRequest.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    }
    // validate the request 
    const { error } = model.validateCreateCoursePoll(coursePollRequest);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // create course poll 
    const coursePoll = await model.coursePoll.create(coursePollRequest);
    res.status(201).json(functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createCoursePollVerb,
        req.body.object.objectType,
        "Course Poll Data",
        { coursePoll: coursePoll }
    ));
}
));


/** 
    * @desc update a course poll 
    * @route PUT /api/course_polls/:id 
    * @method PUT 
    * @access Private
*/
router.put('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {

    // validate the request 
    const coursePollRequest = req.body.context.coursePoll;
    if (!coursePollRequest) {
        return res.status(400).json({ message: 'Course Poll is required' });
    }

    // validate the course poll exists 
    const isCoursePoll = await model.coursePoll.findById(req.params.id);
    if (!isCoursePoll) {
        return res.status(400).json({ message: 'Course Poll not found' });
    }
    // validate the request 
    const { error } = model.validateUpdateCoursePoll(coursePollRequest);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // update course poll 
    const coursePoll = await model.coursePoll.findByIdAndUpdate(req.params.id, coursePollRequest, { new: true, runValidators: true });
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updateCoursePollVerb,
        req.body.object.objectType,
        "Course Poll Data",
        { coursePoll: coursePoll }
    ));
}));


/** 
    * @desc delete a course poll 
    * @route DELETE /api/course_polls/:id 
    * @method DELETE 
    * @access Private
*/
router.delete('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // delete course poll 
    const coursePoll = await model.coursePoll.findByIdAndDelete(req.params.id);
    if (coursePoll) {
        res.status(200).json(functions.responseBodyJSON(200, req.body.actor.id, model.deleteCoursePollVerb, req.body.object.objectType, "Course Poll Data", { coursePoll: coursePoll }));
    } else {
        res.status(404).json({ message: 'Course Poll not found' });
    }
}));

module.exports = router;