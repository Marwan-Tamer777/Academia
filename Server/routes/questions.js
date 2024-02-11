const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/Question');
const quizModel = require('../models/Quiz');
const verifyToken = require('../middlewares/verifyToken');
const functions = require('../utilities/functions');

/**
 * @desc Create a quiz question
 * @route POST /api/quiz_questions
 * @method POST
 * @access Public
 */
/// Create Question
router.post("/", verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {

    //  validate the question data
    const requestQuestion = req.body.context.question;
    if (!requestQuestion) {
        return res.status(400).json({ error: 'Question Data is Required.' });
    }

    // validate the request
    const { error } = model.validateCreateQuestion(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // check if quiz exists
    let quiz = await quizModel.quizModel.findOne({ id: requestQuestion.quizId });
    if (!quiz) {
        return res.status(404).json({ error: 'The quiz with the given ID was not found' });
    }

    // create quiz question
    const question = new model.questionModel({
        id: requestQuestion.id,
        quizId: requestQuestion.quizId,
        question: requestQuestion.question,
        answer: requestQuestion.answer,
        options: requestQuestion.options,
        likes: requestQuestion.likes,
        dislikes: requestQuestion.dislikes,
        weight: requestQuestion.weight,
        correctAnswer: requestQuestion.correctAnswer,
        correctAnswers: requestQuestion.correctAnswers,
        multipleAnswers: requestQuestion.multipleAnswers
    });

    // save quiz_question
    await question.save();

    // add question to quiz
    quiz.questions.push(question.questionId);
    await quiz.save();

    //remove _id from response
    const { _id, ...data } = question._doc;

    res.status(201).json(functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createQuestionVerb,
        req.body.object.objectType,
        "Question Data",
        { question: data },
    ));
}));

/**
 * @desc Get all quiz questions
 * @route GET /api/quiz_questions
 * @method GET
 * @access Public
 */
/// Get All Questions
router.get("/", verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    const { quizId } = req.query;
    if (quizId) {
        const quiz_questions = await model.questionModel
            .find({ quizId: quizId }).select('-_id');
        res.status(200).json(quiz_questions);
    }
    const quiz_questions = await model.questionModel.find().select('-_id');
    res.status(200).json(quiz_questions);
}));

/**
 * @desc Get a quiz question by ID
 * @route GET /api/quiz_questions/:id
 * @method GET
 * @access Public
 */
/// Get Question by ID
router.get(`/:id`, verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    const quiz_question = await model.questionModel.findOne({ questionId: req.params.id }).select('-_id');
    if (!quiz_question) {
        return res.status(404).json({ error: 'The quiz question with the given ID was not found' });
    }
    res.status(200).json(quiz_question);
}));

/**
 * @desc Update a quiz question
 * @route PUT /api/quiz_questions/:id
 * @method PUT
 * @access Public
 */
/// Update Question
router.put(`/:id`, verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {

    //  validate the question data
    const requestQuestion = req.body.context.question;
    if (!requestQuestion) {
        return res.status(400).json({ error: 'Question Data is Required.' });
    }

    // validate the request
    const { error } = model.validateUpdateQuestion(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // update quiz question
    const quiz_question = await model.questionModel.findOneAndUpdate({ id: req.params.id }, {
        question: requestQuestion.question,
        answer: requestQuestion.answer,
        options: requestQuestion.options,
        likes: requestQuestion.likes,
        dislikes: requestQuestion.dislikes
    }, { new: true }).select('-_id');
    if (!quiz_question) {
        return res.status(404).json({ error: 'The quiz question with the given ID was not found' });
    }
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updateQuestionVerb,
        req.body.object.objectType,
        "Question Data",
        { question: quiz_question }
    ));
}));

/**
 * @desc Delete a quiz question
 * @route DELETE /api/quiz_questions/:id                          
 * @method DELETE
 * @access Public
 */
/// Delete Question
router.delete(`/:id`, verifyToken.verifyTokenAndAuthorization, asyncHandler(async (req, res) => {
    const quiz_question = await model.questionModel.findOneAndDelete({ id: req.params.id }).select('-_id');
    if (!quiz_question) {
        return res.status(404).json({ error: 'The quiz question with the given ID was not found' });
    }
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.deleteQuestionVerb,
        req.body.object.objectType,
        "Question Data",
        { question: quiz_question }
    ));
}));

module.exports = router;