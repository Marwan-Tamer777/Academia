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
    * @desc get a material map by id
    * @route GET /api/material_maps/:id
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
    * @desc create a material map
    * @route POST /api/material_maps
    * @method POST 
    * @access Private
*/ 
router.post('/', verifyTokenAndAdmin, asyncHandler(async (req, res) => { 
    // validate the request 
    const materialMapRequest = req.body.context.materialApp; 
    if (!materialMapRequest) {
        return res.status(400).json({ message: 'Material Map is required' });
    } 

    // validate the course exists 
    const isCourse = await course.courseModel.findById(materialMapRequest.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    } 
    
    // validate the request 
    const { error } = model.validateCreateMaterialMap(materialMapRequest); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // create material map
    const materialMap = await model.materialMapModel.create(materialMapRequest); 
    res.status(201).json(functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createMaterialMapVerb,
        req.body.object.objectType,
        "Material Map Data",
        { materialMap: materialMap }
    ));
})); 


/** 
    * @desc update a material map 
    * @route PUT /api/material_maps/:id
    * @method PUT 
    * @access Private
*/ 
router.put('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => { 
    // validate the request 
    const materialMapRequest = req.body.context.materialApp; 
    if (!materialMapRequest) {
        return res.status(400).json({ message: 'Material App is required' });
    } 

    // validate the request 
    const { error } = model.validateUpdateMaterialMap(materialMapRequest); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // update material app 
    const materialApp = await model.materialMapModel.findByIdAndUpdate(req.params.id, materialMapRequest, { new: true }); 
    res.status(200).json(functions.responseBodyJSON( 
        200, 
        req.body.actor.id, 
        model.updateMaterialMapVerb, 
        req.body.object.objectType,
        "Material App Data",
        { materialApp: materialApp } 
    ));
})); 


/** 
    * @desc delete a material map
    * @route DELETE /api/material_maps/:id
    * @method DELETE 
    * @access Private
*/ 
router.delete('/:id', verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // delete material app 
    const materialMap = await model.materialMapModel.findByIdAndDelete(req.params.id);
    if (materialMap) {
        res.status(200).json(functions.responseBodyJSON(
            200,
            req.body.actor.id,
            model.deleteMaterialMapVerb,
            req.body.object.objectType,
            "Material Map Data",
            { materialMap: materialMap }
        ));
    } else {
        res.status(404).json({ message: 'Material Map not found' });
    }
})); 

module.exports = router;