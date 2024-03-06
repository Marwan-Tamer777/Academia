const express = require('express');
const asyncHandler = require('express-async-handler'); 
const router = express.Router(); 
const model = require('../models/ActionMap'); 
const course = require('../models/Course'); 
const functions = require('../utilities/functions'); 
const { verifyToken, verifyTokenAndAuthorization, verifyTokenAndAdmin, } = require('../middlewares/verifyToken'); 


/** 
    * @desc get all action maps 
    * @route GET /api/action_maps 
    * @method GET 
    * @access Private
*/ 
router.get('/', verifyToken, asyncHandler(async (req, res) => { 
    const actionMaps = await model.actionMapModel.find(); 
    res.status(200).json(actionMaps); 
} 
)); 


/** 
    * @desc get an action map by id 
    * @route GET /api/action_maps/:id 
    * @method GET 
    * @access Private
*/ 
router.get('/:id', verifyToken, asyncHandler(async (req, res) => {
    const actionMap = await model.actionMapModel.findById(req.params.id);
    if (actionMap) {
        res.status(200).json(actionMap);
    } else {
        res.status(404).json({ message: 'Action Map not found' });
    }
})); 


/** 
    * @desc create an action map 
    * @route POST /api/action_maps 
    * @method POST 
    * @access Private
*/ 
router.post('/', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the course exists 
    const isCourse = await course.courseModel.findById(req.body.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    } 
    // validate the request 
    const { error } = model.validateCreateActionMap(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // create action map 
    const actionMap = await model.actionMapModel.create(req.body); 
    res.status(201).json(actionMap);
})); 


/** 
    * @desc update an action map 
    * @route PUT /api/action_maps/:id 
    * @method PUT 
    * @access Private
*/ 
router.put('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the course exists 
    const isCourse = await course.courseModel.findById(req.body.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    } 
    // validate the request 
    const { error } = model.validateUpdateActionMap(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // update action map 
    const actionMap = await model.actionMapModel.findByIdAndUpdate(req.params.id, req.body, { new: true }); 
    res.status(200).json(actionMap);
})); 


/** 
    * @desc delete an action map 
    * @route DELETE /api/action_maps/:id 
    * @method DELETE 
    * @access Private
*/ 
router.delete('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const actionMap = await model.actionMapModel.findByIdAndDelete(req.params.id);
    if (actionMap) {
        res.status(200).json({ message: 'Action Map deleted' });
    } else {
        res.status(404).json({ message: 'Action Map not found' });
    }
}));

module.exports = router;