const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// Tag Schema
const tagSchema = new mongoose.Schema({
    _id: {
        type: String,
        unique: true,
        default: uuidv4,
    },
    courseId: {
        type: String,
        required: true,
        trim: true,
    },
    tagName: {
        type: String,
        required: true,
        trim: true,
        minlength: 1,
        maxlength: 100,
    },
}, {    _id: false,

    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
    collection: 'Tags',

});

/// Tag Model
const tagModel = mongoose.model('Tag', tagSchema);

/// Tag Validation
function validateCreateTag(tag) {
    const schema = Joi.object({
        courseId: Joi.string().required(),
        tagName: Joi.string().min(1).max(100).required(),
    });
    return schema.validate(tag);
}

function validateUpdateTag(tag) {
    const schema = Joi.object({
        tagName: Joi.string().min(1).max(100).required(),
    });
    return schema.validate(tag);
}

module.exports = {
    tagModel,
    validateCreateTag,
    validateUpdateTag,
};