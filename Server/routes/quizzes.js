const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/Quiz');
const courseModel = require('../models/Course');
const verifyToken = require('../middlewares/verifyToken');
const functions = require('../utilities/functions');
const { func } = require('joi');

/**
 * @desc Create a quiz
 * @route POST /api/quizzes
 * @method POST
 * @access Public
 */
/// Create Quiz
router.post("/", verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {

    // validate the quiz data
    const requestQuiz = req.body.context.quiz;
    if (!requestQuiz) {
        return res.status(400).json({ error: 'Quiz Data is Required.' });
    }

    // validate the request
    const { error } = model.validateCreateQuiz(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // check if course exists
    let course = await courseModel.courseModel.findById(requestQuiz.courseId);
    if (!course) {
        return res.status(404).json({ error: 'The course with the given ID was not found' });
    }

    // create quiz
    const quiz = new model.quizModel(requestQuiz);

    // save quiz
    await quiz.save();

    // add quiz to course
    course.quizzes.push(quiz.quizId);
    await course.save();

    res.status(201).json(functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createQuizVerb,
        req.body.object.objectType,
        "Quiz Data",
        {quiz: quiz},
    ));
}));

/**
 * @desc Get all quizzes
 * @route GET /api/quizzes
 * @method GET
 * @access Public
 */
/// Get All Quizzes
router.get("/", verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const quizzes = await model.quizModel.find();
    res.status(200).json(quizzes);
}));

/**
 * @desc Get a quiz by ID
 * @route GET /api/quizzes/:id
 * @method GET
 * @access Public
 */
/// Get Quiz by ID
router.get(`/:id`, verifyToken.verifyToken, asyncHandler(async (req, res) => {
    const quiz = await model.quizModel.findById( req.params.id );
    if (!quiz) {
        return res.status(404).json({ error: 'The quiz with the given ID was not found' });
    }
    res.status(200).json(quiz);
}));

/**
 * @desc Update a quiz
 * @route PUT /api/quizzes/:id
 * @method PUT
 * @access Public
 */
/// Update Quiz
router.put(`/:id`, verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {

    // validate the quiz data
    const requestQuiz = req.body.context.quiz;
    if (!requestQuiz) {
        return res.status(400).json({ error: 'Quiz Data is Required.' });
    }

    // validate the request
    const { error } = model.validateUpdateQuiz(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // update quiz
    const quiz = await model.quizModel.findByIdAndUpdate( req.params.id ,
        {
            quizName: requestQuiz.quizName,
            questions: requestQuiz.questions,
            numOfRetries: requestQuiz.numOfRetries,
            duration: requestQuiz.duration,
            startDate: requestQuiz.startDate,
            endDate: requestQuiz.endDate,
            showGrade: requestQuiz.showGrade,
            showWrongAnswers: requestQuiz.showWrongAnswers,
            showCorrectAnswers: requestQuiz.showCorrectAnswers,
        }, { new: true });

    // save quiz
    await quiz.save();
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updateQuizVerb,
        req.body.object.objectType,
        "Quiz Data",
        { quiz: quiz }
    ));
}));

/**
 * @desc Delete a quiz
 * @route DELETE /api/quizzes/:id
 * @method DELETE
 */
/// Delete Quiz
router.delete(`/:id`, verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const quiz = await model.quizModel.findByIdAndDelete( req.params.id );
    if (!quiz) {
        return res.status(404).json({ error: 'The quiz with the given ID was not found' });
    }
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.deleteQuizVerb,
        req.body.object.objectType,
        "Quiz Data",
        { quiz: quiz }
    ));
}));

module.exports = router;
