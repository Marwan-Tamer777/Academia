// const express = require('express');
// const asyncHandler = require('express-async-handler');
// const router = express.Router();
// const model = require('../models/UserCourseInfo');
// const course = require('../models/Course');
// const functions = require('../utilities/functions');
// const { verifyToken, verifyTokenAndAuthorization, verifyTokenAndAdmin, } = require('../middlewares/verifyToken');
// const user = require('../models/User');

// /**
//     * @desc get all user course infos
//     * @route GET /api/user_course_infos
//     * @method GET
//     * @access Private
// */
// router.get('/', verifyToken, asyncHandler(async (req, res) => {
//     const userCourseInfos = await model.userCourseInfoModel.find();
//     res.status(200).json(userCourseInfos);
// }));


// /**
//     * @desc get a user course info by id
//     * @route GET /api/user_course_infos/:id
//     * @method GET
//     * @access Private
// */
// router.get('/:id', verifyToken, asyncHandler(async (req, res) => {
//     const userCourseInfo = await model.userCourseInfoModel.findById(req.params.id);
//     if (userCourseInfo) {
//         res.status(200).json(userCourseInfo);
//     } else {
//         res.status(404).json({ message: 'User Course Info not found' });
//     }
// }));


// /**
//     * @desc create a user course info
//     * @route POST /api/user_course_infos
//     * @method POST
//     * @access Private
// */
// router.post('/', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
//     // validate the request
//     const userCourseInfoRequest = req.body.context.userCourseInfo;
//     if (!userCourseInfoRequest) {
//         return res.status(400).json({ message: 'User Course Info is required' });
//     }

//     // validate the user exists
//     const isUser = await user.userModel.findById(userCourseInfoRequest.userId);
//     if (!isUser) {
//         return res.status(400).json({ message: 'User not found' });
//     }
//     // validate the course exists
//     const isCourse = await course.courseModel.findById(userCourseInfoRequest.courseId);
//     if (!isCourse) {
//         return res.status(400).json({ message: 'Course not found' });
//     }
//     // validate the request
//     const { error } = model.validateCreateUserCourseInfo(userCourseInfoRequest);
//     if (error) {
//         return res.status(400).json({ error: error.details[0].message });
//     }
//     // create user course info
//     const userCourseInfo = await model.userCourseInfo.create(userCourseInfoRequest);
//     res.status(201).json(functions.responseBodyJSON(
//         201,
//         req.body.actor.id,
//         model.createUserCourseInfoVerb,
//         req.body.object.objectType,
//         "User Course Info Data",
//         { userCourseInfo: userCourseInfo }
//     ));
// } ));


// /**
//     * @desc update a user course info
//     * @route PUT /api/user_course_infos/:id
//     * @method PUT
//     * @access Private
// */
// router.put('/:id', verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
//     // validate the request
//     const userCourseInfoRequest = req.body.context.userCourseInfo;
//     if (!userCourseInfoRequest) {
//         return res.status(400).json({ message: 'User Course Info is required' });
//     }

//     // validate the request
//     const { error } = model.validateUpdateUserCourseInfo(userCourseInfoRequest);
//     if (error) {
//         return res.status(400).json({ error: error.details[0].message });
//     }
//     // update user course info
//     const userCourseInfo = await model.userCourseInfo.findByIdAndUpdate(req.params.id, userCourseInfoRequest, { new: true, });
//     res.status(200).json(functions.responseBodyJSON(
//         200,
//         req.body.actor.id,
//         model.updateUserCourseInfoVerb,
//         req.body.object.objectType,
//         "User Course Info Data",
//         { userCourseInfo: userCourseInfo }
//     ));
// }));


// /**
//     * @desc delete a user course info
//     * @route DELETE /api/user_course_infos/:id
//     * @method DELETE
//     * @access Private
// */
// router.delete('/:id', verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
//     // delete user course info
//     const userCourseInfo = await model.userCourseInfoModel.findByIdAndDelete(req.params.id);
//     if (userCourseInfo) {
//         res.status(200).json(functions.responseBodyJSON(
//             200,
//             req.body.actor.id,
//             model.deleteUserCourseInfoVerb,
//             req.body.object.objectType,
//             "User Course Info Data",
//             { userCourseInfo: userCourseInfo }
//         ));
//     } else {
//         res.status(404).json({ message: 'User Course Info not found' });
//     }
// }));

// module.exports = router;