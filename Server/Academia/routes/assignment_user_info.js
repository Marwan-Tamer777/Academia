const express = require('express');
const asyncHandler = require('express-async-handler'); 
const router = express.Router(); 
const model = require('../models/AssignmentUserInfo'); 
const course = require('../models/Course'); 
const user = require('../models/User'); 
const functions = require('../utilities/functions'); 
const { verifyToken, verifyTokenAndAuthorization, verifyTokenAndAdmin, } = require('../middlewares/verifyToken'); 


/** 
    * @desc get all assignment user infos 
    * @route GET /api/assignment_user_infos 
    * @method GET 
    * @access Private
*/ 
router.get('/', verifyToken, asyncHandler(async (req, res) => {
    const assignmentUserInfos = await model.assignmentUserInfoModel.find();
    res.status(200).json(assignmentUserInfos);
})); 


/** 
    * @desc get an assignment user info by id 
    * @route GET /api/assignment_user_infos/:id 
    * @method GET 
    * @access Private
*/ 
router.get('/:id', verifyToken, asyncHandler(async (req, res) => {
    const assignmentUserInfo = await model.assignmentUserInfoModel.findById(req.params.id);
    if (assignmentUserInfo) {
        res.status(200).json(assignmentUserInfo);
    } else {
        res.status(404).json({ message: 'Assignment User Info not found' });
    }
})); 


/** 
    * @desc create an assignment user info 
    * @route POST /api/assignment_user_infos 
    * @method POST 
    * @access Private
*/ 
router.post('/', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the course exists 
    const isCourse = await course.courseModel.findById(req.body.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    } 
    // validate the user exists 
    const isUser = await user.userModel.findById(req.body.userId);
    if (!isUser) {
        return res.status(400).json({ message: 'User not found' });
    } 
    // validate the request 
    const { error } = model.validateCreateAssignmentUserInfo(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // create assignment user info 
    const assignmentUserInfo = await model.assignmentUserInfoModel.create(req.body); 
    res.status(201).json(assignmentUserInfo);
})); 


/** 
    * @desc update an assignment user info 
    * @route PUT /api/assignment_user_infos/:id 
    * @method PUT 
    * @access Private
*/ 
router.put('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the course exists 
    const isCourse = await course.courseModel.findById(req.body.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    } 
    // validate the user exists 
    const isUser = await user.userModel.findById(req.body.userId);
    if (!isUser) {
        return res.status(400).json({ message: 'User not found' });
    } 
    // validate the request 
    const { error } = model.validateUpdateAssignmentUserInfo(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // update assignment user info 
    const assignmentUserInfo = await model.assignmentUserInfoModel.findByIdAndUpdate(req.params.id, req.body, { new: true }); 
    res.status(200).json(assignmentUserInfo);
})); 


/** 
    * @desc delete an assignment user info 
    * @route DELETE /api/assignment_user_infos/:id 
    * @method DELETE 
    * @access Private
*/ 
router.delete('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const assignmentUserInfo = await model.assignmentUserInfoModel.findByIdAndDelete(req.params.id);
    if (assignmentUserInfo) {
        res.status(200).json(assignmentUserInfo);
    } else {
        res.status(404).json({ message: 'Assignment User Info not found' });
    }
})); 


module.exports = router;

