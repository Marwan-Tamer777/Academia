const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/QuizUserInfo');
const course = require('../models/Course');
const user = require('../models/User');
const quizModel = require('../models/Quiz');
const questionModel = require('../models/Question');
const courseUserInfoModel = require('../models/CourseUserInfo');
const statementModel = require('../models/Statement');
const functions = require('../utilities/functions');
const { verifyToken, verifyTokenAndAuthorization, verifyTokenAndAdmin, } = require('../middlewares/verifyToken');


/** 
    * @desc get all quiz user infos 
    * @route GET /api/quiz_user_infos 
    * @method GET 
    * @access Private
*/
router.get('/', verifyToken, asyncHandler(async (req, res) => {
    const page = parseInt(req.query.currentPage) || process.env.defaultPageSize1;
    const limit = parseInt(req.query.pageSize) || process.env.defaultPageAmount;
    const startIndex = (page - 1) * limit;
    const endIndex = page * limit;

    const quizUserInfo = await model.quizUserInfoModel.find().skip(startIndex).limit(limit);
    const total = await model.quizUserInfoModel.countDocuments();

    const pagination = {};

    if (endIndex < total) {
        pagination.next = {
            page: page + 1,
            limit: limit
        };
    } else {
        pagination.next = {};
    }
    if (startIndex > 0) {
        pagination.prev = {
            page: page - 1,
            limit: limit
        };
    } else {
        pagination.prev = {};
    }

    res.status(200).json({
        pagination,
        assignmentUserInfos: quizUserInfo
    });
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
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    // validate the request 
    const quizUserInfoRequest = req.body.context.quizUserInfo;
    if (!quizUserInfoRequest) {
        return res.status(400).json({ message: 'Quiz User Info is required' });
    }

    // validate the course exists 
    const isCourse = await course.courseModel.findById(quizUserInfoRequest.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    }
    // validate the user exists 
    const isUser = await user.userModel.findById(quizUserInfoRequest.userId);
    if (!isUser) {
        return res.status(400).json({ message: 'User not found' });
    }
    // validate the quiz exists
    const isQuiz = await quizModel.quizModel.findById(quizUserInfoRequest.quizId);
    if (!isQuiz) {
        return res.status(400).json({ message: 'Quiz not found' });
    }
    // validate the request 
    const { error } = model.validateCreateQuizUserInfo(quizUserInfoRequest);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // create quiz user info 
    const quizUserInfo = await model.quizUserInfoModel.create(quizUserInfoRequest);
    await res.status(201).json(await functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createQuizUserInfoVerb,
        req.body.object.objectType,
        "Quiz User Info Data",
        { quizUserInfo: quizUserInfo },
        quizUserInfo._id
    ));
}));


/** 
    * @desc update a quiz user info 
    * @route PUT /api/quiz_user_infos/:id 
    * @method PUT 
    * @access Private
*/
router.put('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    // validate the request 
    const quizUserInfoRequest = req.body.context.quizUserInfo;
    if (!quizUserInfoRequest) {
        return res.status(400).json({ message: 'Quiz User Info is required' });
    }

    // validate the course exists 
    if (quizUserInfoRequest.courseId) {
        const isCourse = await course.courseModel.findById(quizUserInfoRequest.courseId);
        if (!isCourse) {
            return res.status(400).json({ message: 'Course not found' });
        }
    }
    // validate the user exists 
    if (quizUserInfoRequest.userId) {
        const isUser = await user.userModel.findById(quizUserInfoRequest.userId);
        if (!isUser) {
            return res.status(400).json({ message: 'User not found' });
        }
    }
    // validate the request 
    const { error } = model.validateUpdateQuizUserInfo(quizUserInfoRequest);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // update quiz user info 
    const quizUserInfo = await model.quizUserInfoModel.findByIdAndUpdate(req.params.id, quizUserInfoRequest, { new: true, runValidators: true });
    if (quizUserInfo) {
        await res.status(200).json(await functions.responseBodyJSON(
            200,
            req.body.actor.id,
            model.updateQuizUserInfoVerb,
            req.body.object.objectType,
            "Quiz User Info Data",
            { quizUserInfo: quizUserInfo },
            quizUserInfo._id
        ));
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
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    // delete quiz user info 
    const quizUserInfo = await model.quizUserInfoModel.findByIdAndDelete(req.params.id);
    if (quizUserInfo) {
        await res.status(200).json(await functions.responseBodyJSON(
            200,
            req.body.actor.id,
            model.deleteQuizUserInfoVerb,
            req.body.object.objectType,
            "Quiz User Info Data",
            { quizUserInfo: quizUserInfo }
        ));
    } else {
        res.status(404).json({ message: 'Quiz User Info not found' });
    }
}));

/**
 * @desc get all quiz user infos by user id
 * @route GET /api/quiz_user_infos/user/:userId
 * @method GET
 * @access Public
 */
router.get('/user/:userId', verifyToken, asyncHandler(async (req, res) => {
    const quizUserInfos = await model.quizUserInfoModel.find({ userId: req.params.userId });
    res.status(200).json(quizUserInfos);
}));


/**
 * @desc get all quiz user infos by course id
 * @route GET /api/quiz_user_infos/course/:courseId
 * @method GET
 * @access Public
 */

router.get('/course/:courseId', verifyToken, asyncHandler(async (req, res) => {
    const quizUserInfos = await model.quizUserInfoModel.find({ courseId: req.params.courseId });
    res.status(200).json(quizUserInfos);
}));

/**
 * @desc get all quiz user infos by quiz id
 * @route GET /api/quiz_user_infos/quiz/:quizId
 * @method GET
 * @access Public
 */

router.get('/quiz/:quizId', verifyToken, asyncHandler(async (req, res) => {
    const quizUserInfos = await model.quizUserInfoModel.find({ quizId: req.params.quizId });
    res.status(200).json(quizUserInfos);
}
));

/**
 * @desc Submit a quiz
 * @route POST /api/quizzes/:id/submit
 * @method POST
 * @access Public
 */
/// Submit Quiz
router.post('/submit', verifyToken, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    // validate the quiz data
    const requestQuizUserInfo = req.body.context.quizUserInfo;
    if (!requestQuizUserInfo) {
        return res.status(400).json({ error: 'Quiz User Info is Required.' });
    }

    // validate the request
    const { error } = model.validateSubmitQuizUserInfo(requestQuizUserInfo);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // check if quiz exists
    let quiz = await quizModel.quizModel.findById(requestQuizUserInfo.quizId);
    if (!quiz) {
        return res.status(404).json({ error: 'The quiz with the given ID was not found' });
    }
    // check if course exists
    let courseReq = await course.courseModel.findById(requestQuizUserInfo.courseId);
    if (!courseReq) {
        return res.status(404).json({ error: 'The course with the given ID was not found' });
    }
    // check if user exists
    let userReq = await user.userModel.findById(requestQuizUserInfo.userId);
    if (!userReq) {
        return res.status(404).json({ error: 'The user with the given ID was not found' });
    }


    //Grade the quiz if auto grading is enabled
    let grade = 0;
    if (quiz.autoGrade) {

        for (let i = 0; i < quiz.questions.length; i++) {
            let question = await questionModel.questionModel.findById(quiz.questions[i]);
            if (question.multipleAnswers) {
                // if (question.correctAnswers.sort().toString() === requestQuizUserInfo.answers[i].sort().toString()) {
                //     grade += question.weight;
                // }
            } else {
                if (question.correctAnswer === requestQuizUserInfo.answers[i]) {
                    grade += question.weight;
                }
            }

        }
    }

    // update quiz user info data
    requestQuizUserInfo.maxGrade = quiz.grade;
    requestQuizUserInfo.grade = grade;
    requestQuizUserInfo.showGrade = quiz.showGrade;
    requestQuizUserInfo.submissionUrl = "http:SubUrl.com";
    requestQuizUserInfo.gradedBy = "UnAssigned";


    // check if user has taken the quiz before
    let quizUserInfo;
    quizUserInfo = await model.quizUserInfoModel.findOne({ quizId: requestQuizUserInfo.quizId, userId: requestQuizUserInfo.userId });
    if (quizUserInfo) {
        if (quizUserInfo.retriesLeft <= 0) {
            return res.status(400).json({ error: 'User has no retries left' });
        }
        requestQuizUserInfo.retriesLeft = quizUserInfo.retriesLeft - 1;

        // update quiz user info
        quizUserInfo = await model.quizUserInfoModel.findByIdAndUpdate(quizUserInfo._id, requestQuizUserInfo, { new: true, runValidators: true });

        // update last grade in course user info
        let cui = await courseUserInfoModel.courseUserInfo.findOneAndUpdate({ courseId: requestQuizUserInfo.courseId, userId: requestQuizUserInfo.userId }, { mostRecentGrade: requestQuizUserInfo.grade }, { new: true, runValidators: true });
        if (!cui) {
            return res.status(404).json({ error: 'Course User Info not found Make sure the user is Enrolled In Course' });
        }

        await res.status(200).json(await functions.responseBodyJSON(
            200,
            req.body.actor.id,
            model.submitQuizUserInfoVerb,
            req.body.object.objectType,
            "Quiz User Info Data",
            { quizUserInfo: quizUserInfo },
            quizUserInfo._id
        ));
    } else {
        requestQuizUserInfo.retriesLeft = quiz.numOfRetries;

        quizUserInfo = new model.quizUserInfoModel(requestQuizUserInfo);

        // save quiz user info
        await quizUserInfo.save();

        // update last grade in course user info
        let cui = await courseUserInfoModel.courseUserInfo.findOneAndUpdate({ courseId: requestQuizUserInfo.courseId, userId: requestQuizUserInfo.userId }, { mostRecentGrade: requestQuizUserInfo.grade }, { new: true, runValidators: true });
        if (!cui) {
            return res.status(404).json({ error: 'Course User Info not found Make sure the user is Enrolled In Course' });
        }

        await res.status(201).json(await functions.responseBodyJSON(
            201,
            req.body.actor.id,
            model.submitQuizUserInfoVerb,
            req.body.object.objectType,
            "Quiz User Info Data",
            { quizUserInfo: quizUserInfo },
            quizUserInfo._id
        ));
    }




}));


module.exports = router;