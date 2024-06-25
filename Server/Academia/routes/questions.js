const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/Question');
const quizModel = require('../models/Quiz');
const statementModel = require('../models/Statement');
const verifyToken = require('../middlewares/verifyToken');
const functions = require('../utilities/functions');

/**
 * @desc Create a quiz question
 * @route POST /api/quiz_questions
 * @method POST
 * @access Public
 */
/// Create Question
router.post("/", verifyToken.verifyToken, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

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
    let quiz = await quizModel.quizModel.findById(requestQuestion.quizId);
    if (!quiz) {
        return res.status(404).json({ error: 'The quiz with the given ID was not found' });
    }

    // create quiz question
    const question = new model.questionModel(requestQuestion);

    // save quiz_question
    await question.save();

    // add question to quiz
    quiz.questions.push(question._id);
    await quiz.save();

    await res.status(201).json(await functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createQuestionVerb,
        req.body.object.objectType,
        "Question Data",
        { question: question },
        question._id
    ));
}));

/**
 * @desc Get all quiz questions
 * @route GET /api/quiz_questions
 * @method GET
 * @access Public
 */
/// Get All Questions
router.get("/", verifyToken.verifyToken, asyncHandler(async (req, res) => {
    const questions = await model.questionModel.find();
    res.status(200).json(questions);
}));

/**
 * @desc Get a quiz question by ID
 * @route GET /api/quiz_questions/:id
 * @method GET
 * @access Public
 */
/// Get Question by ID
router.get(`/:id`, verifyToken.verifyToken, asyncHandler(async (req, res) => {
    const quiz_question = await model.questionModel.findById(req.params.id);
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
router.put(`/:id`, verifyToken.verifyToken, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

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
    const question = await model.questionModel.findByIdAndUpdate(req.params.id, {
        question: requestQuestion.question,
        answer: requestQuestion.answer,
        options: requestQuestion.options,
        likes: requestQuestion.likes,
        dislikes: requestQuestion.dislikes
    }, { new: true });
    if (!question) {
        return res.status(404).json({ error: 'The quiz question with the given ID was not found' });
    }
    await res.status(200).json(await functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updateQuestionVerb,
        req.body.object.objectType,
        "Question Data",
        { question: question },
        question._id
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
    const quiz_question = await model.questionModel.findByIdAndDelete(req.params.id);
    if (!quiz_question) {
        return res.status(404).json({ error: 'The quiz question with the given ID was not found' });
    }
    await res.status(200).json(await functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.deleteQuestionVerb,
        req.body.object.objectType,
        "Question Data",
        { question: quiz_question },
        quiz_question._id
    ));
}));

module.exports = router;