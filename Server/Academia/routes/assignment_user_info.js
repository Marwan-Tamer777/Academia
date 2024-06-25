const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/AssignmentUserInfo');
const course = require('../models/Course');
const user = require('../models/User');
const assignment = require('../models/Assignment');
const statementModel = require('../models/Statement');
const functions = require('../utilities/functions');
const { verifyToken, verifyTokenAndAuthorization, verifyTokenAndAdmin, } = require('../middlewares/verifyToken');


/** 
    * @desc get all assignment user infos 
    * @route GET /api/assignment_user_infos 
    * @method GET 
    * @access Private
*/
router.get('/', verifyToken, asyncHandler(async (req, res) => {
    const page = parseInt(req.query.currentPage) || process.env.defaultPageSize1;
    const limit = parseInt(req.query.pageSize) || process.env.defaultPageAmount;
    const startIndex = (page - 1) * limit;
    const endIndex = page * limit;

    const assignmentUserInfos = await model.assignmentUserInfoModel.find().skip(startIndex).limit(limit);
    const total = await model.assignmentUserInfoModel.countDocuments();

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
        assignmentUserInfos
    });
}));

/** 
 * @desc get an assignment user info by assignment id
 * @route GET /api/assignment_user_infos/assignment/:id
 * @method GET
 * @access Private
 */
router.get('/assignment/:id', verifyToken, asyncHandler(async (req, res) => {
    const assignmentUserInfos = await model.assignmentUserInfoModel.find({ assignmentId: req.params.id });
    if (assignmentUserInfos) {
        res.status(200).json(assignmentUserInfos);
    } else {
        res.status(404).json({ message: 'No Assignments Found' });
    }
}
));

/** 
 * @desc get an assignment user info by Course id
 * @route GET /api/assignment_user_infos/assignment/:id
 * @method GET
 * @access Private
 */
router.get('/course/:id', verifyToken, asyncHandler(async (req, res) => {
    const assignmentUserInfos = await model.assignmentUserInfoModel.find({ courseId: req.params.id });
    if (assignmentUserInfos) {
        res.status(200).json(assignmentUserInfos);
    } else {
        res.status(404).json({ message: 'No Assignments Found' });
    }
}
));

/** 
 * @desc get an assignment user info by User id
 * @route GET /api/assignment_user_infos/User/:id
 * @method GET
 * @access Private
 */
router.get('/user/:id', verifyToken, asyncHandler(async (req, res) => {
    const assignmentUserInfos = await model.assignmentUserInfoModel.find({ userId: req.params.id });
    if (assignmentUserInfos) {
        res.status(200).json(assignmentUserInfos);
    } else {
        res.status(404).json({ message: 'No Assignments Found' });
    }
}
));

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
router.post('/', verifyToken, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    // validate the assignment user info exists 
    const requestAssignmentUserInfo = req.body.context.assignmentUserInfo;
    if (!requestAssignmentUserInfo) {
        return res.status(400).json({ message: 'Assignment User Info not found' });
    }
    // validate the user exists 
    const userExists = await user.userModel.findById(requestAssignmentUserInfo.userId);
    if (!userExists) {
        return res.status(400).json({ message: 'User not found' });
    }
    // validate the assignment exists
    const assignmentExists = await assignment.assignmentModel.findById(requestAssignmentUserInfo.assignmentId);
    if (!assignmentExists) {
        return res.status(400).json({ message: 'Assignment not found' });
    }
    // validate the request 
    const { error } = model.validateCreateAssignmentUserInfo(requestAssignmentUserInfo);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // create assignment user info 
    const assignmentUserInfo = await model.assignmentUserInfoModel.create(requestAssignmentUserInfo);
    await res.status(201).json(await functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createAssignmentUserInfoVerb,
        req.body.object.objectType,
        "Assignment User Info Data",
        { assignmentUserInfo: assignmentUserInfo },
        assignmentUserInfo._id
    ));
}));


/** 
    * @desc update an assignment user info 
    * @route PUT /api/assignment_user_infos/:id 
    * @method PUT 
    * @access Private
*/
router.put('/:id', verifyToken, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    // validate the assignment user info exists
    const requestAssignmentUserInfo = req.body.context.assignmentUserInfo;
    if (!requestAssignmentUserInfo) {
        return res.status(400).json({ message: 'Assignment User Info not found' });
    }

    // validate the course exists 
    const isCourse = await course.courseModel.findById(requestAssignmentUserInfo.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    }
    // validate the user exists 
    const isUser = await user.userModel.findById(requestAssignmentUserInfo.userId);
    if (!isUser) {
        return res.status(400).json({ message: 'User not found' });
    }
    // validate the request 
    const { error } = model.validateUpdateAssignmentUserInfo(requestAssignmentUserInfo);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // update assignment user info 
    const assignmentUserInfo = await model.assignmentUserInfoModel.findByIdAndUpdate(req.params.id, requestAssignmentUserInfo, { new: true });
    await res.status(200).json(await functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.updateAssignmentUserInfoVerb,
        req.body.object.objectType,
        "Assignment User Info Data",
        { assignmentUserInfo: assignmentUserInfo },
        assignmentUserInfo._id
    ));
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
        await res.status(200).json(await functions.responseBodyJSON(
            201,
            req.body.actor.id,
            model.deleteAssignmentUserInfoVerb,
            req.body.object.objectType,
            "Assignment User Info Data",
            { assignmentUserInfo: assignmentUserInfo },
            assignmentUserInfo._id
        ));
    } else {
        res.status(404).json({ message: 'Assignment User Info not found' });
    }
}));

/**
 * @desc Submit an assignment
 * @route POST /api/assignment_user_infos/submit
 * @method POST
 * @access Private
 */
router.post('/submit', verifyToken, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    // validate the assignment user info exists
    const requestAssignmentUserInfo = req.body.context.assignmentUserInfo;
    if (!requestAssignmentUserInfo) {
        return res.status(400).json({ message: 'Assignment User Info not found' });
    }

    // validate the request 
    const { error } = model.validateSubmitAssignmentUserInfo(requestAssignmentUserInfo);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // validate the course exists 
    const isCourse = await course.courseModel.findById(requestAssignmentUserInfo.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    }
    // validate the user exists 
    const isUser = await user.userModel.findById(requestAssignmentUserInfo.userId);
    if (!isUser) {
        return res.status(400).json({ message: 'User not found' });
    }
    // validate the assignment exists
    const assignmentExists = await assignment.assignmentModel.findById(requestAssignmentUserInfo.assignmentId);
    if (!assignmentExists) {
        return res.status(400).json({ message: 'Assignment not found' });
    }



    // create assignment user info 

    requestAssignmentUserInfo.submissionDate = new Date();
    requestAssignmentUserInfo.gradedBy = "UnAssigned";
    requestAssignmentUserInfo.showGrade = assignmentExists.showGrade;
    requestAssignmentUserInfo.grade = 0;
    requestAssignmentUserInfo.maxGrade = assignmentExists.grade;
    requestAssignmentUserInfo.submissionUrl = "https://www.google.com";

    const assignmentUserInfo = await model.assignmentUserInfoModel.create(requestAssignmentUserInfo);
    await res.status(201).json(await functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.submitAssignmentUserInfoVerb,
        req.body.object.objectType,
        "Assignment User Info Data",
        { assignmentUserInfo: assignmentUserInfo },
        assignmentUserInfo._id
    ));
}
));

module.exports = router;

