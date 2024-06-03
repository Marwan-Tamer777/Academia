const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/CourseUserInfo');
const course = require('../models/Course');
const role = require('../models/Role');
const functions = require('../utilities/functions');
const { verifyToken, verifyTokenAndAuthorization, verifyTokenAndAdmin, } = require('../middlewares/verifyToken');
const user = require('../models/User');

/**
    * @desc get all course User infos
    * @route GET /api/user_course_infos
    * @method GET
    * @access Private
*/
router.get('/', verifyToken, asyncHandler(async (req, res) => {
    const page = parseInt(req.query.currentPage) || process.env.defaultPageSize1;
    const limit = parseInt(req.query.pageSize) || process.env.defaultPageAmount;
    const startIndex = (page - 1) * limit;
    const endIndex = page * limit;

    const courseUserInfos = await model.courseUserInfo.find().skip(startIndex).limit(limit);
    const total = await model.courseUserInfo.countDocuments();


    const pagination = {};


    if (endIndex < total) {
        pagination.next = {
            page: page + 1,
            limit: limit
        };
    }
    if (startIndex > 0) {
        pagination.prev = {
            page: page - 1,
            limit: limit
        };
    }

    res.status(200).json({
        pagination,
        courseUserInfos
    });
}));


/**
    * @desc get a course User info by id
    * @route GET /api/user_course_infos/:id
    * @method GET
    * @access Private
*/
router.get('/:id', verifyToken, asyncHandler(async (req, res) => {
    const courseUserInfo = await model.courseUserInfo.findById(req.params.id);
    if (courseUserInfo) {
        res.status(200).json(courseUserInfo);
    } else {
        res.status(404).json({ message: 'Course User Info not found' });
    }
}));

/**
 * @desc get a course User info by user id
 * @route GET /api/user_course_infos/user/:id
 * @method GET  
 */

router.get('/user/:id', verifyToken, asyncHandler(async (req, res) => {
    const courseUserInfo = await model.courseUserInfo.find({ userId: req.params.id });
    if (courseUserInfo) {
        res.status(200).json(courseUserInfo);
    } else {
        res.status(404).json({ message: 'Course User Info not found' });
    }
}
));

/**
 * @desc get a course User info by course id
 * @route GET /api/user_course_infos/course/:id
 * @method GET  
 */

router.get('/course/:id', verifyToken, asyncHandler(async (req, res) => {
    const courseUserInfo = await model.courseUserInfo.find({ courseId: req.params.id });
    if (courseUserInfo) {
        res.status(200).json(courseUserInfo);
    } else {
        res.status(404).json({ message: 'Course User Info not found' });
    }
}
));


/**
    * @desc create a course User info
    * @route POST /api/user_course_infos
    * @method POST
    * @access Private
*/
router.post('/', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the request
    const courseUserInfoRequest = req.body.context.courseUserInfo;
    if (!courseUserInfoRequest) {
        return res.status(400).json({ message: 'Course User Info is required' });
    }

    // validate the user exists
    const isUser = await user.userModel.findById(courseUserInfoRequest.userId);
    if (!isUser) {
        return res.status(400).json({ message: 'User not found' });
    }
    // validate the course exists
    const isCourse = await course.courseModel.findById(courseUserInfoRequest.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    }
    // validate the role exists
    const isRole = await role.roleModel.findById(courseUserInfoRequest.roleId);
    if (!isRole) {
        return res.status(400).json({ message: 'Role not found' });
    }

    // validate the request
    const { error } = model.validateCreateCourseUserInfo(courseUserInfoRequest);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // create course User info
    const courseUserInfo = await model.courseUserInfo.create(courseUserInfoRequest);
    res.status(201).json(functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createCourseUserInfoVerb,
        req.body.object.objectType,
        "Course User Info Data",
        { courseUserInfo: courseUserInfo }
    ));
}));


/**
    * @desc update a course User info
    * @route PUT /api/user_course_infos/:id
    * @method PUT
    * @access Private
*/
router.put('/:id', verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    // validate the courseUserInfoRequest exists
    const courseUserInfoRequest = req.body.context.courseUserInfo;
    if (!courseUserInfoRequest) {
        return res.status(400).json({ message: 'Course User Info is required' });
    }

    // validate the user exists
    const isUser = await user.userModel.findById(courseUserInfoRequest.userId);
    if (!isUser) {
        return res.status(400).json({ message: 'User not found' });
    }
    // validate the course exists
    const isCourse = await course.courseModel.findById(courseUserInfoRequest.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    }
    // validate the role exists
    const isRole = await role.roleModel.findById(courseUserInfoRequest.roleId);
    if (!isRole) {
        return res.status(400).json({ message: 'Role not found' });
    }


    // validate the request
    const { error } = model.validateUpdateCourseUserInfo(courseUserInfoRequest);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // update course User info
    const courseUserInfo = await model.courseUserInfo.findByIdAndUpdate(req.params.id, courseUserInfoRequest, { new: true, });
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updateCourseUserInfoVerb,
        req.body.object.objectType,
        "Course User Info Data",
        { courseUserInfo: courseUserInfo }
    ));
}));


/**
    * @desc delete a course User info
    * @route DELETE /api/user_course_infos/:id
    * @method DELETE
    * @access Private
*/
router.delete('/:id', verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    // delete course User info
    const courseUserInfo = await model.courseUserInfo.findByIdAndDelete(req.params.id);
    if (courseUserInfo) {
        res.status(200).json(functions.responseBodyJSON(
            200,
            req.body.actor.id,
            model.deleteCourseUserInfoVerb,
            req.body.object.objectType,
            "Course User Info Data",
            { courseUserInfo: courseUserInfo }
        ));
    } else {
        res.status(404).json({ message: 'Course User Info not found' });
    }
}));

module.exports = router;