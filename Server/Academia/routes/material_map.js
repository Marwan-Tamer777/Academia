const express = require('express');
const asyncHandler = require('express-async-handler'); 
const router = express.Router(); 
const model = require('../models/MaterialMap'); 
const course = require('../models/Course'); 
const functions = require('../utilities/functions'); 
const { verifyToken, verifyTokenAndAuthorization, verifyTokenAndAdmin, } = require('../middlewares/verifyToken'); 


/** 
    * @desc get all material apps 
    * @route GET /api/material_apps 
    * @method GET 
    * @access Private
*/ 
router.get('/', verifyToken, asyncHandler(async (req, res) => {
    const materialApps = await model.materialAppModel.find();
    res.status(200).json(materialApps);
})); 


/** 
    * @desc get a material app by id 
    * @route GET /api/material_apps/:id 
    * @method GET 
    * @access Private
*/ 
router.get('/:id', verifyToken, asyncHandler(async (req, res) => {
    const materialApp = await model.materialAppModel.findById(req.params.id);
    if (materialApp) {
        res.status(200).json(materialApp);
    } else {
        res.status(404).json({ message: 'Material App not found' });
    }
})); 


/** 
    * @desc create a material app 
    * @route POST /api/material_apps 
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
    const { error } = model.validateCreateMaterialApp(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // create material app 
    const materialApp = await model.materialAppModel.create(req.body); 
    res.status(201).json(materialApp);
})); 


/** 
    * @desc update a material app 
    * @route PUT /api/material_apps/:id 
    * @method PUT 
    * @access Private
*/ 
router.put('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the request 
    const { error } = model.validateUpdateMaterialApp(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // update material app 
    const materialApp = await model.materialAppModel.findByIdAndUpdate(req.params.id, req.body, { new: true }); 
    res.status(200).json(materialApp);
})); 


/** 
    * @desc delete a material app 
    * @route DELETE /api/material_apps/:id 
    * @method DELETE 
    * @access Private
*/ 
router.delete('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // delete material app 
    const materialApp = await model.materialAppModel.findByIdAndDelete(req.params.id);
    if (materialApp) {
        res.status(200).json({ message: 'Material App deleted' });
    } else {
        res.status(404).json({ message: 'Material App not found' });
    }
})); 

module.exports = router;