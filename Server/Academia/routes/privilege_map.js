const express = require('express');
const asyncHandler = require('express-async-handler'); 
const router = express.Router();
const model = require('../models/PrivilegeMap'); 
const course = require('../models/Course');
const functions = require('../utilities/functions'); 
const { verifyToken, verifyTokenAndAuthorization, verifyTokenAndAdmin, } = require('../middlewares/verifyToken'); 


/** 
    * @desc get all privilege maps 
    * @route GET /api/privilege_maps 
    * @method GET 
    * @access Private
*/ 
router.get('/', verifyToken, asyncHandler(async (req, res) => {
    const privilegeMaps = await model.privilegeMapModel.find();
    res.status(200).json(privilegeMaps);
})); 


/** 
    * @desc get a privilege map by id 
    * @route GET /api/privilege_maps/:id 
    * @method GET 
    * @access Private
*/ 
router.get('/:id', verifyToken, asyncHandler(async (req, res) => {
    const privilegeMap = await model.privilegeMapModel.findById(req.params.id);
    if (privilegeMap) {
        res.status(200).json(privilegeMap);
    } else {
        res.status(404).json({ message: 'Privilege Map not found' });
    }
})); 


/** 
    * @desc create a privilege map 
    * @route POST /api/privilege_maps 
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
    const { error } = model.validateCreatePrivilegeMap(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // create privilege map 
    const privilegeMap = await model.privilegeMapModel.create(req.body); 
    res.status(201).json(privilegeMap);
})); 


/** 
    * @desc update a privilege map 
    * @route PUT /api/privilege_maps/:id 
    * @method PUT 
    * @access Private
*/ 
router.put('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the request 
    const { error } = model.validateUpdatePrivilegeMap(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // update privilege map 
    const privilegeMap = await model.privilegeMapModel.findByIdAndUpdate(req.params.id, req.body, { new: true }); 
    if (privilegeMap) {
        res.status(200).json(privilegeMap);
    } else {
        res.status(404).json({ message: 'Privilege Map not found' });
    }
})); 


/** 
    * @desc delete a privilege map 
    * @route DELETE /api/privilege_maps/:id 
    * @method DELETE 
    * @access Private
*/ 
router.delete('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const privilegeMap = await model.privilegeMapModel.findByIdAndDelete(req.params.id);
    if (privilegeMap) {
        res.status(200).json({ message: 'Privilege Map deleted successfully' });
    } else {
        res.status(404).json({ message: 'Privilege Map not found' });
    }
}));

module.exports = router;