const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
const statementModel = require('../models/Statement');
const model = require('../models/Tag');
const verifyToken = require('../middlewares/verifyToken');

/**
 * @desc Create a tag
 * @route POST /api/tags
 * @method POST
 * @access Public
 */
/// Create Tag
router.post("/", verifyToken.verifyToken, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    // validate the request data
    const requestTag = req.body.context.tag;
    if (!requestTag) {
        return res.status(400).json({ error: 'Tag Data is Required.' });
    }

    // validate the request
    const { error } = model.validateCreateTag(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }

    // create tag
    const tag = new model.tagModel(requestTag);

    // save tag
    await tag.save();
    res.status(201).json(tag);
}));

/**
 * @desc Get all tags
 * @route GET /api/tags
 * @method GET
 * @access Public
 */
/// Get All Tags
router.get("/", verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const tags = await model.tagModel.find();
    res.status(200).json(tags);
}));

/**
 * @desc Get a tag by ID
 * @route GET /api/tags/:id
 * @method GET
 * @access Public
 */
/// Get Tag by ID
router.get(`/:id`, verifyToken.verifyToken, asyncHandler(async (req, res) => {
    const tag = await model.tagModel.findById(req.params.id);
    if (!tag) {
        return res.status(404).json({ error: 'The tag with the given ID was not found' });
    }
    res.status(200).json(tag);
}));

/**
 * @desc Update a tag
 * @route PUT /api/tags/:id
 * @method PUT
 * @access Public
 */
/// Update Tag
router.put(`/:id`, verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    // validate the request body
    const { requestError } = statementModel.validateCreateStatement(req.body);
    if (requestError) {
        return res.status(400).json({ error: requestError.details[0].message });
    }
    const statement = new statementModel.statementModel(req.body);

    // save Statement
    await statement.save();

    // validate the request
    const { error } = model.validateUpdateTag(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // update tag
    const tag = await model.tagModel.findByIdAndUpdate(req.params.id, {
        name: req.body.name,
        description: req.body.description
    }, { new: true });
    if (!tag) {
        return res.status(404).json({ error: 'The tag with the given ID was not found' });
    }
    res.status(200).json(tag);
}));

/**
 * @desc Delete a tag
 * @route DELETE /api/tags/:id
 * @method DELETE
 * @access Public
 */
/// Delete Tag
router.delete(`/:id`, verifyToken.verifyTokenAndAdmin, asyncHandler(async (req, res) => {
    const tag = await model.tagModel.findByIdAndDelete(req.params.id);
    if (!tag) {
        return res.status(404).json({ error: 'The tag with the given ID was not found' });
    }
    res.status(200).json(tag);
}));

module.exports = router;