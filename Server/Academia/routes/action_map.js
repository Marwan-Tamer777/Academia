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
// router.get('/', verifyToken, asyncHandler(async (req, res) => {
//     const actionMaps = await model.actionMapModel.find();
//     res.status(200).json(actionMaps);
// }
// ));

/** 
    * @desc get all action maps with pagination 
    * @route GET /api/action_maps 
    * @method GET 
    * @access Private
*/
router.get('/', verifyToken, asyncHandler(async (req, res) => {
    let { pageSize, currentPage } = req.query;

    // check if pageSize and currentPage are provided
    if (!pageSize) {
        pageSize = process.env.defaultPageSize
    }
    if (!currentPage) {
        currentPage = 1;
    }
    if (pageSize) {
        pageSize = parseInt(pageSize);
    }
    if (currentPage) {
        currentPage = parseInt(currentPage);
    }
    if (isNaN(pageSize) || isNaN(currentPage) || pageSize < 1 || currentPage < 1) {
        return res.status(400).json({ message: 'Invalid query parameters' });
    }
    console.log(pageSize, currentPage);
    const actionMaps = await model.actionMapModel.find().limit(pageSize).skip((currentPage - 1) * pageSize);
    res.status(200).json(functions.responseBodyJSON(
        200,
        " req.body.actor.id",
        model.createActionMapVerb,
        "req.body.object.objectType",
        "Action Map Data",
        { actionMaps: actionMaps },
    ));
}));


/** 
    * @desc create an action map 
    * @route POST /api/action_maps 
    * @method POST 
    * @access Private
*/
router.post('/', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the Action Map exists 
    const requestActionMap = req.body.context.actionMap;
    if (!requestActionMap) {
        return res.status(400).json({ message: 'Action Map is not Found' });
    }
    // validate the request 
    const { error } = model.validateCreateActionMap(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // create action map 
    const actionMap = new model.actionMapModel(requestActionMap);
    // save action map
    await actionMap.save();
    res.status(201).json(functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createActionMapVerb,
        req.body.object.objectType,
        "Action Map Data",
        { actionMap: actionMap },
    ));
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