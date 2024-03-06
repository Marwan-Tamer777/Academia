const express = require('express');
const asyncHandler = require('express-async-handler'); 
const router = express.Router();  
const model = require('../models/UserCourseInfo');  
const course = require('../models/Course');
const functions = require('../utilities/functions'); 
const { verifyToken, verifyTokenAndAuthorization, verifyTokenAndAdmin, } = require('../middlewares/verifyToken'); 
const user = require('../models/User'); 

/** 
    * @desc get all user course infos 
    * @route GET /api/user_course_infos 
    * @method GET 
    * @access Private
*/ 
router.get('/', verifyToken, asyncHandler(async (req, res) => {
    const userCourseInfos = await model.userCourseInfoModel.find();
    res.status(200).json(userCourseInfos);
})); 


/** 
    * @desc get a user course info by id 
    * @route GET /api/user_course_infos/:id 
    * @method GET 
    * @access Private
*/ 
router.get('/:id', verifyToken, asyncHandler(async (req, res) => {
    const userCourseInfo = await model.userCourseInfoModel.findById(req.params.id);
    if (userCourseInfo) {
        res.status(200).json(userCourseInfo);
    } else {
        res.status(404).json({ message: 'User Course Info not found' });
    }
})); 


/** 
    * @desc create a user course info 
    * @route POST /api/user_course_infos 
    * @method POST 
    * @access Private
*/ 
router.post('/', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the user exists 
    const isUser = await user.userModel.findById(req.body.userId);
    if (!isUser) {
        return res.status(400).json({ message: 'User not found' });
    } 
    // validate the course exists 
    const isCourse = await course.courseModel.findById(req.body.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    } 
    // validate the request 
    const { error } = model.validateCreateUserCourseInfo(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // create user course info 
    const userCourseInfo = await model.userCourseInfoModel.create(req.body); 
    res.status(201).json(userCourseInfo);
} )); 


/** 
    * @desc update a user course info 
    * @route PUT /api/user_course_infos/:id 
    * @method PUT 
    * @access Private
*/ 
router.put('/:id', verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    // validate the request 
    const { error } = model.validateUpdateUserCourseInfo(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // update user course info 
    const userCourseInfo = await model.userCourseInfoModel.findByIdAndUpdate(req.params.id, req.body, { new: true, }); 
    res.status(200).json(userCourseInfo);
})); 


/** 
    * @desc delete a user course info 
    * @route DELETE /api/user_course_infos/:id 
    * @method DELETE 
    * @access Private
*/ 
router.delete('/:id', verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    // delete user course info 
    const userCourseInfo = await model.userCourseInfoModel.findByIdAndDelete(req.params.id);
    if (userCourseInfo) {
        res.status(200).json({ message: 'User Course Info deleted successfully' });
    } else {
        res.status(404).json({ message: 'User Course Info not found' });
    }
}));

module.exports = router;