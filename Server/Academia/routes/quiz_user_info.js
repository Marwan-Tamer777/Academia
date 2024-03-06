const express = require('express');
const asyncHandler = require('express-async-handler'); 
const router = express.Router(); 
const model = require('../models/QuizUserInfo'); 
const course = require('../models/Course'); 
const user = require('../models/User'); 
const functions = require('../utilities/functions'); 
const { verifyToken, verifyTokenAndAuthorization, verifyTokenAndAdmin, } = require('../middlewares/verifyToken'); 


/** 
    * @desc get all quiz user infos 
    * @route GET /api/quiz_user_infos 
    * @method GET 
    * @access Private
*/ 
router.get('/', verifyToken, asyncHandler(async (req, res) => {
    const quizUserInfos = await model.quizUserInfoModel.find();
    res.status(200).json(quizUserInfos);
})); 


/** 
    * @desc get a quiz user info by id 
    * @route GET /api/quiz_user_infos/:id 
    * @method GET 
    * @access Private
*/ 
router.get('/:id', verifyToken, asyncHandler(async (req, res) => {
    const quizUserInfo = await model.quizUserInfoModel.findById(req.params.id);
    if (quizUserInfo) {
        res.status(200).json(quizUserInfo);
    } else {
        res.status(404).json({ message: 'Quiz User Info not found' });
    }
})); 


/** 
    * @desc create a quiz user info 
    * @route POST /api/quiz_user_infos 
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
    const { error } = model.validateCreateQuizUserInfo(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // create quiz user info 
    const quizUserInfo = await model.quizUserInfoModel.create(req.body); 
    res.status(201).json(quizUserInfo);
})); 


/** 
    * @desc update a quiz user info 
    * @route PUT /api/quiz_user_infos/:id 
    * @method PUT 
    * @access Private
*/ 
router.put('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the course exists 
    if (req.body.courseId) {
        const isCourse = await course.courseModel.findById(req.body.courseId);
        if (!isCourse) {
            return res.status(400).json({ message: 'Course not found' });
        }
    } 
    // validate the user exists 
    if (req.body.userId) {
        const isUser = await user.userModel.findById(req.body.userId);
        if (!isUser) {
            return res.status(400).json({ message: 'User not found' });
        }
    } 
    // validate the request 
    const { error } = model.validateUpdateQuizUserInfo(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // update quiz user info 
    const quizUserInfo = await model.quizUserInfoModel.findByIdAndUpdate(req.params.id, req.body, { new: true, runValidators: true }); 
    if (quizUserInfo) {
        res.status(200).json(quizUserInfo);
    } else {
        res.status(404).json({ message: 'Quiz User Info not found' });
    }
})); 


/** 
    * @desc delete a quiz user info 
    * @route DELETE /api/quiz_user_infos/:id 
    * @method DELETE 
    * @access Private
*/ 
router.delete('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // delete quiz user info 
    const quizUserInfo = await model.quizUserInfoModel.findByIdAndDelete(req.params.id);
    if (quizUserInfo) {
        res.status(200).json(quizUserInfo);
    } else {
        res.status(404).json({ message: 'Quiz User Info not found' });
    }
})); 

module.exports = router;
