const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/Course');
const verifyToken = require('../middlewares/verifyToken');
const functions = require('../utilities/functions');
const { roleModel } = require('../models/Role');


/**
 * @desc Get all courses
 * @route GET /api/courses
 * @method GET
 * @access Public
 */
/// Get All Courses
router.get("/", asyncHandler(async (req, res) => {
    // Comparison query operators
    // eq (equal)
    // ne (not equal)
    // gt (greater than)
    // gte (greater than or equal to)
    // lt (less than)
    // lte (less than or equal to)
    // more info: https://docs.mongodb.com/manual/reference/operator/query-comparison/
    const courses = await model.courseModel.find();
    res.status(200).json(courses);
}));


/**
 * @desc Get a course by ID
 * @route GET /api/courses/:id
 * @method GET
 * @access Public
 */
/// Get Course by ID
router.get(`/:id`, asyncHandler(async (req, res) => {
    const course = await model.courseModel.findById(req.params.id );
    if (!course) {
        return res.status(404).json({ error: 'The course with the given ID was not found' });
    }
    res.status(200).json(course);
}));

/**
 * @desc Create a course
 * @route POST /api/courses
 * @method POST
 * @access Public
 */
/// Create Course
router.post("/", verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the course data
    const requestCourse = req.body.context.course;
    if (!requestCourse) {
        return res.status(400).json({ error: 'Course Data is Required.' });
    }

    // validate the request
    const { error } = model.validateCreateCourse(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // create course
    const course = new model.courseModel(requestCourse);

    // save course
    await course.save();
    res.status(201).json(functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createCourseVerb,
        req.body.object.objectType,
        "Course Data",
        { course: course },
    ));

}));

/**
 * @desc Update a course
 * @route PUT /api/courses/:id
 * @method PUT
 * @access Public
 */

/// Update Course
router.put("/:id", verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the course data 
    const requestCourse = req.body.context.course
    if (!requestCourse) {
        return res.status(400).json({ error: 'Course Data is Required.' });
    }

    // validate the request
    const { error } = model.validateUpdateCourse(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // find the course
    const course = await model.courseModel.findById(req.params.id);
    if (!course) {
        return res.status(404).json({ error: 'The course with the given ID was not found' });
    }

    // update course
    const updatedCourse = await model.courseModel.findByIdAndUpdate(req.params.id , {
        name: requestCourse.name,
        courseCode: requestCourse.courseCode,
        enrollCode: requestCourse.enrollCode,
        teachers: requestCourse.teachers,
        students: requestCourse.students,
        currentCapacity: requestCourse.currentCapacity,
        maxCapacity: requestCourse.maxCapacity,
        quizzes: requestCourse.quizzes,
        posts: requestCourse.posts,
        materials: requestCourse.materials,
        roles: requestCourse.roles
    }, {
        new: true // return the updated document
    });

    // save course
    await updatedCourse.save();
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updateCourseVerb,
        req.body.object.objectType,
        "Course Data",
        { course: updatedCourse },
    )
    );
}));

/**
 * @desc Delete a course
 * @route DELETE /api/courses/:id
 * @method DELETE
 * @access Public
 * @param id
 */
/// Delete Course
router.delete("/:id", verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // find the course
    console.log(req.params.id);
    const course = await model.courseModel.findByIdAndDelete(req.params.id);
    if (!course) {
        return res.status(404).json({ error: 'The course with the given ID was not found' });
    }
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.deleteCourseVerb,
        req.body.object.objectType,
        "Course Data",
        { course: course },
    ));
}));

/// Modules
module.exports = router;