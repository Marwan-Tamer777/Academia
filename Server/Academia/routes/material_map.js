const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/MaterialMap');
const statementModel = require('../models/Statement');
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
    const materialMaps = await model.materialMapModel.find();
    res.status(200).json(materialMaps);
}));


/** 
    * @desc get a material map by id
    * @route GET /api/material_maps/:id
    * @method GET 
    * @access Private
*/
router.get('/:id', verifyToken, asyncHandler(async (req, res) => {
    const materialMap = await model.materialMapModel.findById(req.params.id);
    if (materialMap) {
        res.status(200).json(materialMap);
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
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    // validate the request 
    const materialMapRequest = req.body.context.materialMap;
    if (!materialMapRequest) {
        return res.status(400).json({ message: 'Material Map is required' });
    }

    // // validate the course exists 
    // const isCourse = await course.courseModel.findById(materialMapRequest.courseId);
    // if (!isCourse) {
    //     return res.status(400).json({ message: 'Course not found' });
    // } 

    // validate the request 
    const { error } = model.validateCreateMaterialMap(materialMapRequest);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // create material map
    const materialMap = await model.materialMapModel.create(materialMapRequest);
    await res.status(201).json(await functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createMaterialMapVerb,
        req.body.object.objectType,
        "Material Map Data",
        { materialMap: materialMap },
        materialMap._id
    ));
}));


/** 
    * @desc update a material map 
    * @route PUT /api/material_maps/:id
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

    // validate the request 
    const materialMapRequest = req.body.context.materialMap;
    if (!materialMapRequest) {
        return res.status(400).json({ message: 'Material App is required' });
    }

    // validate the request 
    const { error } = model.validateUpdateMaterialMap(materialMapRequest);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // update material app 
    const materialMap = await model.materialMapModel.findByIdAndUpdate(req.params.id, materialMapRequest, { new: true });
    await res.status(200).json(await functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updateMaterialMapVerb,
        req.body.object.objectType,
        "Material App Data",
        { materialMap: materialMap },
        materialMap._id
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
        await res.status(200).json(await functions.responseBodyJSON(
            200,
            req.body.actor.id,
            model.deleteMaterialMapVerb,
            req.body.object.objectType,
            "Material Map Data",
            { materialMap: materialMap },
            materialMap._id
        ));
    } else {
        res.status(404).json({ message: 'Material Map not found' });
    }
}));

module.exports = router;