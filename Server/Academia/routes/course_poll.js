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
    const coursePolls = await model.coursePollModel.find();
    res.status(200).json(coursePolls);
})); 


/** 
    * @desc get a course poll by id 
    * @route GET /api/course_polls/:id 
    * @method GET 
    * @access Private
*/ 
router.get('/:id', verifyToken, asyncHandler(async (req, res) => {
    const coursePoll = await model.coursePollModel.findById(req.params.id);
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
    // validate the course exists 
    const isCourse = await course.courseModel.findById(req.body.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    } 
    // validate the request 
    const { error } = model.validateCreateCoursePoll(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // create course poll 
    const coursePoll = await model.coursePollModel.create(req.body); 
    res.status(201).json(coursePoll); 
} 
)); 


/** 
    * @desc update a course poll 
    * @route PUT /api/course_polls/:id 
    * @method PUT 
    * @access Private
*/ 
router.put('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the course poll exists 
    const isCoursePoll = await model.coursePollModel.findById(req.params.id);
    if (!isCoursePoll) {
        return res.status(400).json({ message: 'Course Poll not found' });
    } 
    // validate the request 
    const { error } = model.validateUpdateCoursePoll(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // update course poll 
    const coursePoll = await model.coursePollModel.findByIdAndUpdate(req.params.id, req.body, { new: true, runValidators: true }); 
    res.status(200).json(coursePoll);
})); 


/** 
    * @desc delete a course poll 
    * @route DELETE /api/course_polls/:id 
    * @method DELETE 
    * @access Private
*/ 
router.delete('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // delete course poll 
    const coursePoll = await model.coursePollModel.findByIdAndDelete(req.params.id);
    if (coursePoll) {
        res.status(200).json({ message: 'Course Poll deleted successfully' });
    } else {
        res.status(404).json({ message: 'Course Poll not found' });
    }
})); 

module.exports = router;