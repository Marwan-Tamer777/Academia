const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const model = require('../models/Material');
const courseModel = require('../models/Course');
const verifyToken = require('../middlewares/verifyToken');
const functions = require('../utilities/functions');
const { func } = require('joi');


/**
 * @desc Create a material
 * @route POST /api/materials
 * @method POST
 * @access Public
 */
/// Create Material
router.post("/", verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {

    // validate the material
    const requestMaterial = req.body.context.material;
    if (!requestMaterial) {
        return res.status(400).json({ error: 'The material is required.' });
    }

    // validate the request
    const { error } = model.validateCreateMaterial(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // check if course exists
    let course = await courseModel.courseModel.findById( requestMaterial.courseId );
    if (!course) {
        return res.status(400).json({ error: 'The course with the given ID was not found' });
    }

    // create material
    const material = new model.materialModel(requestMaterial);

    // save material
    await material.save();

    // Add material to course
    course.materials.push(material.id);
    await course.save();

    res.status(201).json(functions.responseBodyJSON(
        201,
        req.body.actor.id,
        model.createMaterialVerb,
        req.body.object.objectType,
        "Material Data",
        { material: material },
    ));
}));

/**
 * @desc Get all materials
 * @route GET /api/materials
 * @method GET
 * @access Public
 */
/// Get All Materials
router.get("/", verifyToken.verifyToken, asyncHandler(async (req, res) => {
    const materials = await model.materialModel.find();
    res.status(200).json(materials);
}));

/**
 * @desc Get a material by ID
 * @route GET /api/materials/:id
 * @method GET
 * @access Public
 */
/// Get Material by ID
router.get(`/:id`, verifyToken.verifyToken, asyncHandler(async (req, res) => {
    const material = await model.materialModel.findById( req.params.id );
    if (!material) {
        return res.status(404).json({ error: 'The material with the given ID was not found' });
    }
    res.status(200).json(material);
}));

/**
 * @desc Update a material
 * @route PUT /api/materials/:id
 * @method PUT
 * @access Public
 */
/// Update Material
router.put(`/:id`, verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {

    // check if material exists
    requestMaterial = req.body.context.material;
    if (!requestMaterial) {
        return res.status(400).json({ error: 'The material is required.' });
    }

    // validate the request
    const { error } = model.validateUpdateMaterial(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // update material
    const material = await model.materialModel.findByIdAndUpdate( req.params.id ,
        {
            materialName: requestMaterial.materialName,
            materialTypeCode: requestMaterial.materialTypeCode,
            link: requestMaterial.link,
            description: requestMaterial.description,
        }, { new: true });
    if (!material) {
        return res.status(404).json({ error: 'The material with the given ID was not found' });
    }
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.updateMaterialVerb,
        req.body.object.objectType,
        "Material Data",
        { material: material },
    ));
}));

/**
 * @desc Delete a material
 * @route DELETE /api/materials/:id
 * @method DELETE
 * @access Public
 */
/// Delete Material
router.delete(`/:id`, verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {

    // delete material
    const material = await model.materialModel.findByIdAndDelete( req.params.id );
    if (!material) {
        return res.status(404).json({ error: 'The material with the given ID was not found' });
    }
    res.status(200).json(functions.responseBodyJSON(
        200,
        req.body.actor.id,
        model.deleteMaterialVerb,
        req.body.object.objectType,
        "Material Data",
        { material: material },
    ));
}));

module.exports = router;