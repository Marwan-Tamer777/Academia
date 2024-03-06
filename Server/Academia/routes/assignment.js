const express = require('express');
const asyncHandler = require('express-async-handler'); 
const router = express.Router();   
const model = require('../models/Assignment'); 
const course = require('../models/Course'); 
const functions = require('../utilities/functions'); 
const { verifyToken, verifyTokenAndAuthorization, verifyTokenAndAdmin, } = require('../middlewares/verifyToken'); 


/** 
    * @desc get all assignments 
    * @route GET /api/assignments 
    * @method GET 
    * @access Private
*/ 
router.get('/', verifyToken, asyncHandler(async (req, res) => {
    const assignments = await model.assignmentModel.find();
    res.status(200).json(assignments);
})); 


/** 
    * @desc get an assignment by id 
    * @route GET /api/assignments/:id 
    * @method GET 
    * @access Private
*/ 
router.get('/:id', verifyToken, asyncHandler(async (req, res) => {
    const assignment = await model.assignmentModel.findById(req.params.id);
    if (assignment) {
        res.status(200).json(assignment);
    } else {
        res.status(404).json({ message: 'Assignment not found' });
    }
})); 


/** 
    * @desc create an assignment 
    * @route POST /api/assignments 
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
    const { error } = model.validateCreateAssignment(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // create assignment 
    const assignment = await model.assignmentModel.create(req.body); 
    res.status(201).json(assignment); 
})); 


/** 
    * @desc update an assignment 
    * @route PUT /api/assignments/:id 
    * @method PUT 
    * @access Private
*/ 
router.put('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the assignment exists 
    const isAssignment = await model.assignmentModel.findById(req.params.id); 
    if (!isAssignment) {
        return res.status(400).json({ message: 'Assignment not found' });
    } 
    // validate the request 
    const { error } = model.validateUpdateAssignment(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // update assignment 
    const assignment = await model.assignmentModel.findByIdAndUpdate (req.params.id, req.body, { new: true, }); 
    if (assignment) {
        res.status(200).json(assignment);
    } else {
        res.status(404).json({ message: 'Assignment not found' });
    } 
} )); 


/** 
    * @desc delete an assignment 
    * @route DELETE /api/assignments/:id 
    * @method DELETE 
    * @access Private
*/ 
router.delete('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // delete assignment 
    const assignment = await model.assignmentModel.findByIdAndDelete(req.params.id); 
    if (assignment) {
        res.status(200).json({ message: 'Assignment deleted successfully' });
    } else {
        res.status(404).json({ message: 'Assignment not found' });
    }
})); 

module.exports = router;

