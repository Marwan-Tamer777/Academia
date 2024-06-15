const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/Statement');
const statement = require('../models/Statement');
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
    const { error } = model.validateCreateStatement(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // create statement 
    const statement = await model.statementModel.create(req.body);
    await res.status(201).json(await functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createStatementsVerb,
        req.body.object.objectType,
        "Statement Data",
        { statement: statement },
        statement._id
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
    const { error } = model.validateUpdateStatement(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // update statement 
    const statement = await model.statementModel.findByIdAndUpdate(req.params.id, req.body, { new: true });
    await res.status(200).json(await functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updateStatementsVerb,
        req.body.object.objectType,
        "Statement Data",
        { statement: statement },
        statement._id
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
        await   res.status(200).json(await functions.responseBodyJSON(
            200,
            req.body.actor.id,
            model.deleteStatementsVerb,
            req.body.object.objectType,
            "Statement Data",
            { statement: statement },
            statement._id
        ));
    } else {
        res.status(404).json({ message: 'Statement not found' });
    }
}));

module.exports = router;