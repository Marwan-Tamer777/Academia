const express = require('express');
const asyncHandler = require('express-async-handler');
const router = express.Router();
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
    // validate the request
    const { error } = model.validateCreateTag(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // create tag
    const tag = new model.TagModel({
        id: req.body.id,
        name: req.body.name,
        description: req.body.description
    });
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
    const tag = await model.tagModel.findOne({ id: req.params.id });
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
    // validate the request
    const { error } = model.validateUpdateTag(req.body);
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    }
    // update tag
    const tag = await model.tagModel.findOneAndUpdate({ id: req.params.id }, {
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
    const tag = await model.tagModel.findOneAndDelete({ id: req.params.id });
    if (!tag) {
        return res.status(404).json({ error: 'The tag with the given ID was not found' });
    }
    res.status(200).json(tag);
}));

module.exports = router;