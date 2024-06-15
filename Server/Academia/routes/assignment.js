const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/Assignment');
const course = require('../models/Course');
const statementModel = require('../models/Statement');
const functions = require('../utilities/functions');
const { verifyToken, verifyTokenAndAuthorization, verifyTokenAndAdmin, } = require('../middlewares/verifyToken');


/** 
    * @desc get all assignments 
    * @route GET /api/assignments 
    * @method GET 
    * @access Private
*/
router.get('/', verifyToken, asyncHandler(async (req, res) => {
    const assignments = await model.assignmentModel.find();
    res.status(200).json(assignments);
}));


/** 
    * @desc get an assignment by id 
    * @route GET /api/assignments/:id 
    * @method GET 
    * @access Private
*/
router.get('/:id', verifyToken, asyncHandler(async (req, res) => {
    const assignment = await model.assignmentModel.findById(req.params.id);
    if (assignment) {
        res.status(200).json(assignment);
    } else {
        res.status(404).json({ message: 'Assignment not found' });
    }
}));


/** 
    * @desc create an assignment 
    * @route POST /api/assignments 
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

    // validate the assignment exists 
    const requestAssignment = req.body.context.assignment;
    if (!requestAssignment) {
        return res.status(400).json({ error: 'Assignment Data is Required.' });
    }
    // validate the request 
    const { error } = model.validateCreateAssignment(req.body.context.assignment);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // create assignment 
    const assignment = await model.assignmentModel.create(requestAssignment);
    await res.status(201).json(await functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createAssignmentVerb,
        req.body.object.objectType,
        "Assignment Data",
        {
            assignment: assignment,
        },
        assignment._id
    ));
}));


/** 
    * @desc update an assignment 
    * @route PUT /api/assignments/:id 
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

    // validate the assignment exists 
    const isAssignment = await model.assignmentModel.findById(req.params.id);
    if (!isAssignment) {
        return res.status(400).json({ message: 'Assignment not found' });
    }
    // validate the request 
    const { error } = model.validateUpdateAssignment(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // update assignment 
    const assignment = await model.assignmentModel.findByIdAndUpdate(req.params.id, req.body, { new: true, });
    if (assignment) {
        await res.status(200).json(await functions.responseBodyJSON(
            201,
            req.body.actor.id,
            model.updateAssignmentVerb,
            req.body.object.objectType,
            "Assignment Data",
            {
                assignment: assignment,
            },
            assignment._id
        ));
    } else {
        res.status(404).json({ message: 'Assignment not found' });
    }
}));


/** 
    * @desc delete an assignment 
    * @route DELETE /api/assignments/:id 
    * @method DELETE 
    * @access Private
*/
router.delete('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // delete assignment 
    const assignment = await model.assignmentModel.findByIdAndDelete(req.params.id);
    if (assignment) {
        await res.status(200).json(await functions.responseBodyJSON(
            201,
            req.body.actor.id,
            model.deleteAssignmentVerb,
            req.body.object.objectType,
            "Assignment Data",
            {
                assignment: assignment,
            },
            assignment._id
        ));
    } else {
        res.status(404).json({ message: 'Assignment not found' });
    }
}));

module.exports = router;

