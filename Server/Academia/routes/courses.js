const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/Course');
const verifyToken = require('../middlewares/verifyToken');
const statementModel = require('../models/Statement');
const user = require('../models/User');
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
    const course = await model.courseModel.findById(req.params.id);
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
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    // validate the course data
    const requestCourse = req.body.context.course;
    if (!requestCourse) {
        return res.status(400).json({ error: 'Course Data is Required.' });
    }

    // validate the request
    const { error } = model.validateCreateCourse(requestCourse);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // create course
    const course = new model.courseModel(requestCourse);

    // save course
    await course.save();
    await res.status(201).json(await functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createCourseVerb,
        req.body.object.objectType,
        "Course Data",
        { course: course },
        course._id
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
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();
    // validate the course data 
    const requestCourse = req.body.context.course
    if (!requestCourse) {
        return res.status(400).json({ error: 'Course Data is Required.' });
    }

    // validate the request
    const { error } = model.validateUpdateCourse(requestCourse);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // find the course
    const course = await model.courseModel.findById(req.params.id);
    if (!course) {
        return res.status(404).json({ error: 'The course with the given ID was not found' });
    }

    // update course
    const updatedCourse = await model.courseModel.findByIdAndUpdate(req.params.id, {
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
    await res.status(200).json(await functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updateCourseVerb,
        req.body.object.objectType,
        "Course Data",
        { course: updatedCourse },
        course._id
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
    await res.status(200).json(await functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.deleteCourseVerb,
        req.body.object.objectType,
        "Course Data",
        { course: course },
        course._id
    ));
}));

/// search course by name or course code with sorting
router.post("/search", asyncHandler(async (req, res) => {
    const search = req.body.search;
    const sortBy = req.body.sortBy;
    if (search === undefined || search === "") {
        return res.status(400).json({ error: 'Search is Required.' });
    }
    let courses;
    if (sortBy === "name") {
        courses = await model.courseModel.find({
            $or: [
                { name: { $regex: search, $options: 'i' } },
                { courseCode: { $regex: search, $options: 'i' } }
            ]
        }).sort({ name: 1 });
    } else if (sortBy === "courseCode") {
        courses = await model.courseModel.find({
            $or: [
                { name: { $regex: search, $options: 'i' } },
                { courseCode: { $regex: search, $options: 'i' } }
            ]
        }).sort({ courseCode: 1 });
    } else {
        courses = await model.courseModel.find({
            $or: [
                { name: { $regex: search, $options: 'i' } },
                { courseCode: { $regex: search, $options: 'i' } }
            ]
        });
    }
    res.status(200).json(courses);
}));

/// get all courses in the ids list 
router.post("/getAll", asyncHandler(async (req, res) => {
    const ids = req.body.ids;

    // Check if ids is an array and is not empty
    if (!ids || !Array.isArray(ids) || !ids.length) {
        return res.status(400).json({ error: 'No course IDs provided' });
    }

    const courses = await model.courseModel.find({
        _id: { $in: ids }
    });

    res.status(200).json(courses);
}));

/// get all courses for a user 
router.get("/user/:id", asyncHandler(async (req, res) => {
    const courses = await model.courseModel.find({
        $or: [
            { teachers: req.params.id },
            { students: req.params.id }
        ]
    });
    res.status(200).json(courses);
}));

/// get all students for a course 
router.get("/:id/students", asyncHandler(async (req, res) => {
    const course = await model.courseModel.findById(req.params.id);
    if (!course) {
        return res.status(404).json({ error: 'The course with the given ID was not found' });
    }
    const students = await user.userModel.find({
        _id: { $in: course.teachers.concat(course.students) }
    });
    res.status(200).json(students);
}));

/// get all teachers for a course 
router.get("/:id/teachers", asyncHandler(async (req, res) => {
    const course = await model.courseModel.findById(req.params.id);
    if (!course) {
        return res.status(404).json({ error: 'The course with the given ID was not found' });
    }
    const teachers = await user.userModel.find({
        _id: { $in: course.teachers.concat(course.teachers) }
    });
    res.status(200).json(teachers);
}));

/// Enroll a student to a course
router.post("/enroll/:id", asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();
    // validate the course data 
    const requestCourse = req.body.context.course
    if (!requestCourse) {
        return res.status(400).json({ error: 'Course Data is Required.' });
    }
    const requestStudent = req.body.context.student
    if (!requestStudent) {
        return res.status(400).json({ error: 'Student Data is Required.' });
    }
    // validate the request
    const { error } = model.validateEnrollCourse(req.body.context);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // find the course
    const course = await model.courseModel.findById(req.params.id);
    // check if the course exists
    if (!course) {
        return res.status(404).json({ error: 'The course with the given ID was not found' });
    }
    // find the student
    const student = await user.userModel.findById(requestStudent.id);
    // check if the student exists
    if (!student) {
        return res.status(404).json({ error: 'The student with the given ID was not found' });
    }

    // validate the ability to enroll
    if (course.currentCapacity >= course.maxCapacity) {
        return res.status(400).json({ error: 'The course is full' });
    }
    if (course.enrollCode !== requestCourse.enrollCode) {
        return res.status(400).json({ error: 'The enroll code is incorrect' });
    }
    if (course.students.includes(requestStudent.id)) {
        return res.status(400).json({ error: 'The student is already enrolled in the course' });
    }


    course.students.push(requestStudent.id);
    course.currentCapacity += 1;
    await course.save();

    student.courses.push(course._id);
    await student.save();

    await res.status(200).json(await functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.enrollCourseVerb,
        req.body.object.objectType,
        "Course Data",
        { course: course },
        course._id
    ));
}));

/// Unenroll a student from a course
router.post("/unenroll/:id", asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();
    // validate the course data 
    const requestStudent = req.body.context.student
    if (!requestStudent) {
        return res.status(400).json({ error: 'Student Data is Required.' });
    }
    // validate the request
    const { error } = model.validateEnrollCourse(req.body.context);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // find the course
    const course = await model.courseModel.findById(req.params.id);
    // check if the course exists
    if (!course) {
        return res.status(404).json({ error: 'The course with the given ID was not found' });
    }
    // find the student
    const student = await user.userModel.findById(requestStudent.id);
    // check if the student exists
    if (!student) {
        return res.status(404).json({ error: 'The student with the given ID was not found' });
    }

    // validate the ability to unenroll
    if (!course.students.includes(requestStudent.id)) {
        return res.status(400).json({ error: 'The student is not enrolled in the course' });
    }

    course.students = course.students.filter((id) => id !== requestStudent.id);
    course.currentCapacity -= 1;
    await course.save();

    student.courses = student.courses.filter((id) => id !== course._id);
    await student.save();

    await res.status(200).json(await functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.unenrollCourseVerb,
        req.body.object.objectType,
        "Course Data",
        { course: course },
        course._id
    ));
}));

/// Modules
module.exports = router; 