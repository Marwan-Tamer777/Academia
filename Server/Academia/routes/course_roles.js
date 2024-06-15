const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/CourseRoles');
const statementModel = require('../models/Statement');
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
}));


/** 
 * @desc create a course role 
 * @route POST /api/course_roles 
 * @method POST 
 * @access Private
 */
router.post('/', verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    // validate the request 
    const courseRoleRequest = req.body.context.courseRole;
    if (!courseRoleRequest) {
        return res.status(400).json({ message: 'Course Role is required' });
    }
    // validate the course exists 
    const isCourse = await course.courseModel.findById(courseRoleRequest.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    }
    // validate the request 
    const { error } = model.validateCreateCourseRoles(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // create course role 
    const courseRole = await model.courseRolesModel.create(courseRoleRequest);
    await res.status(201).json(await functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createCourseRolesVerb,
        req.body.object.objectType,
        "Course Role Data",
        { courseRole: courseRole },
        courseRole._id
    ));
}));


/** 
 * @desc update a course role 
 * @route PUT /api/course_roles/:id 
 * @method PUT 
 * @access Private
 */
router.put('/:id', verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    // validate the request 
    const courseRoleRequest = req.body.context.courseRole;
    if (!courseRoleRequest) {
        return res.status(400).json({ message: 'Course Role is required' });
    }

    // validate the course exists 
    const isCourse = await course.courseModel.findById(courseRoleRequest.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    }

    // validate the request  
    const { error } = model.validateUpdateCourseRoles(courseRoleRequest);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // update course role 
    const courseRole = await model.courseRolesModel.findByIdAndUpdate(req.params.id, courseRoleRequest, { new: true });
    if (courseRole) {
        await res.status(200).json(await functions.responseBodyJSON(
            200,
            req.body.actor.id,
            model.updateCourseRolesVerb,
            req.body.object.objectType,
            "Course Role Data",
            { courseRole: courseRole },
            courseRole._id
        ));
    } else {
        res.status(404).json({ message: 'Course Role not found' });
    }
}));


/** 
 * @desc delete a course role 
 * @route DELETE /api/course_roles/:id 
 * @method DELETE 
 * @access Private
 */
router.delete('/:id', verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const courseRole = await model.courseRolesModel.findByIdAndDelete(req.params.id);
    if (courseRole) {
        await res.status(200).json(await functions.responseBodyJSON(
            200,
            req.body.actor.id,
            model.deleteCourseRolesVerb,
            req.body.object.objectType,
            "Course Role Data",
            { courseRole: courseRole },
            courseRole._id
        ));
    } else {
        res.status(404).json({ message: 'Course Role not found' });
    }
}));

module.exports = router;