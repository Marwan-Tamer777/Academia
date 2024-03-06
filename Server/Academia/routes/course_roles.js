const express = require('express');
const asyncHandler = require('express-async-handler'); 
const router = express.Router(); 
const model = require('../models/CourseRoles'); 
const course = require('../models/Course');
const functions = require('../utilities/functions'); 
const verifyToken = require('../middlewares/verifyToken'); 

/**
 * @desc get all course roles 
 * @route GET /api/course_roles 
 * @method GET 
 * @access Private
 */
router.get('/', verifyToken.verifyToken, asyncHandler(async (req, res) => {
    const courseRoles = await model.courseRolesModel.find();
    res.json(courseRoles);
})); 


/** 
 * @desc get a course role by id 
 * @route GET /api/course_roles/:id 
 * @method GET 
 * @access Private
 */ 
router.get('/:id', verifyToken.verifyToken, asyncHandler(async (req, res) => {
    const courseRole = await model.courseRolesModel.findById(req.params.id);
    if (courseRole) {
        res.json(courseRole);
    } else {
        res.status(404).json({ message: 'Course Role not found' });
    } 
} )); 


/** 
 * @desc create a course role 
 * @route POST /api/course_roles 
 * @method POST 
 * @access Private
 */ 
router.post('/', verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the course exists 
    const isCourse = await course.courseModel.findById(req.body.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    } 
    // validate the request 
    const { error } = model.validateCreateCourseRole(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // create course role 
    const courseRole = await model.courseRolesModel.create(req.body); 
    res.json(courseRole).status(201);
} )); 


/** 
 * @desc update a course role 
 * @route PUT /api/course_roles/:id 
 * @method PUT 
 * @access Private
 */ 
router.put('/:id', verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the request 
    const { error } = model.validateUpdateCourseRole(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // update course role 
    const courseRole = await model.courseRolesModel.findByIdAndUpdate(req.params.id, req.body, { new: true }); 
    if (courseRole) {
        res.json(courseRole);
    } else {
        res.status(404).json({ message: 'Course Role not found' });
    } 
} )); 


/** 
 * @desc delete a course role 
 * @route DELETE /api/course_roles/:id 
 * @method DELETE 
 * @access Private
 */ 
router.delete('/:id', verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const courseRole = await model.courseRolesModel.findByIdAndDelete(req.params.id); 
    if (courseRole) {
        res.json(courseRole);
    } else {
        res.status(404).json({ message: 'Course Role not found' });
    } 
} ));

module.exports = router;