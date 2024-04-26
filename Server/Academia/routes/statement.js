const express = require('express');
const asyncHandler = require('express-async-handler'); 
const router = express.Router(); 
const model = require('../models/Statement'); 
const user = require('../models/User');
const functions = require('../utilities/functions'); 
const { verifyToken, verifyTokenAndAuthorization, verifyTokenAndAdmin, } = require('../middlewares/verifyToken'); 


/** 
    * @desc get all statements 
    * @route GET /api/statements 
    * @method GET 
    * @access Private
*/ 
router.get('/', verifyToken, asyncHandler(async (req, res) => {
    const statements = await model.statementModel.find();
    res.status(200).json(statements);
})); 


/** 
    * @desc get a statement by id 
    * @route GET /api/statements/:id 
    * @method GET 
    * @access Private
*/ 
router.get('/:id', verifyToken, asyncHandler(async (req, res) => {
    const statement = await model.statementModel.findById(req.params.id);
    if (statement) {
        res.status(200).json(statement);
    } else {
        res.status(404).json({ message: 'Statement not found' });
    }
})); 


/** 
    * @desc create a statement 
    * @route POST /api/statements 
    * @method POST 
    * @access Private
*/ 
router.post('/', verifyTokenAndAdmin, asyncHandler(async (req, res) => { 
    // validate the request 
    const statementRequest = req.body.context.statement; 
    if (!statementRequest) {
        return res.status(400).json({ message: 'Statement is required' });
    } 

    // validate the user exists 
    const isUser = await user.userModel.findById(statementRequest.userId); 
    if (!isUser) {
        return res.status(400).json({ message: 'User not found' });
    } 

    // validate the request
    const { error } = model.validateCreateStatement(statementRequest); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 

    // create statement 
    const statement = await model.statementModel.create(statementRequest); 
    res.status(201).json(functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createStatementsVerb,
        req.body.object.objectType,
        "Statement Data",
        { statement: statement }
    ));
})); 


/** 
    * @desc update a statement 
    * @route PUT /api/statements/:id 
    * @method PUT 
    * @access Private
*/ 
router.put('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => { 
    // validate the request 
    const statementRequest = req.body.context.statement; 
    if (!statementRequest) {
        return res.status(400).json({ message: 'Statement is required' });
    } 

    // validate the course exists 
    const isCourse = await model.courseModel.findById(statementRequest.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    } 

    // validate the request 
    const { error } = model.validateUpdateStatement(statementRequest); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 

    // update statement 
    const statement = await model.statementModel.findByIdAndUpdate(req.params.id, statementRequest, { new: true }); 
    res.status(200).json(functions.responseBodyJSON( 
        200,
        req.body.actor.id,
        model.updateStatementsVerb,
        req.body.object.objectType,
        "Statement Data",
        { statement: statement } 
    ));
})); 


/** 
    * @desc delete a statement 
    * @route DELETE /api/statements/:id 
    * @method DELETE 
    * @access Private
*/ 
router.delete('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const statement = await model.statementModel.findByIdAndDelete(req.params.id);
    if (statement) {
        res.status(200).json(functions.responseBodyJSON(
            200,
            req.body.actor.id,
            model.deleteStatementsVerb,
            req.body.object.objectType,
            "Statement Data",
            { statement: statement }
        ));
    } else {
        res.status(404).json({ message: 'Statement not found' });
    }
}));

module.exports = router;