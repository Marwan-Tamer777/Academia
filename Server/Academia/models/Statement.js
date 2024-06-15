const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');
const { request } = require('express');

/// Statement Schema
const statementSchema = new mongoose.Schema({
    _id: {
        type: String,
        unique: true,
        default: uuidv4,
    },
    timestamp: {
        type: Date,
        default: new Date().toISOString(),
    },
    statusCode: {
        type: Number,
        required: false,
    },
    actor: {
        type: Object,
        required: true,
        trim: true,
    },
    verb: {
        type: Object,
        required: true,
        trim: true,
    },

    object: {
        type: Object,
        required: true,
        trim: true,
    },
    context: {
        type: Object,
        required: true,
        trim: true,
    },
}, {
    _id: false,
    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
    collection: 'Statements',

});

/// Statement Model
const statementModel = mongoose.model('Statement', statementSchema);

/// Statement Validation
function validateCreateStatement(statement) {
    const schema = Joi.object({
        timestamp: Joi.date().required(),
        statusCode: Joi.number().required(),
        actor: Joi.object({
            name: Joi.string().trim().min(1).required(),
            id: Joi.string().trim().min(1).required(),
            requestBy: Joi.string().trim().min(1).required(),
        }).required(),
        verb: Joi.object({
            "id-enum": Joi.string().trim().min(1).required(),
            display: Joi.object({
                "en-US": Joi.string().trim().min(1).required()
            }).required(),
        }).required(), object: Joi.object({
            id: Joi.string().trim().min(1).required(),
            objectType: Joi.string().trim().min(1).required(),
            definition: Joi.object({
                name: Joi.object({
                    "en-US": Joi.string().trim().min(1).required()
                }).required()
            }).required()
        }).required(),
        context: Joi.object().required(),

    });
    return schema.validate(statement);
}

function validateUpdateStatement(statement) {
    const schema = Joi.object({
        timestamp: Joi.date().required(),
        statusCode: Joi.number().required(),
        actor: Joi.object({
            name: Joi.string().trim().min(1).required(),
            id: Joi.string().trim().min(1).required(),
            requestBy: Joi.string().trim().min(1).required(),
        }).required(),
        verb: Joi.object({
            "id-enum": Joi.string().trim().min(1).required(),
            display: Joi.object({
                "en-US": Joi.string().trim().min(1).required()
            }).required(),
        }).required(), object: Joi.object({
            id: Joi.string().trim().min(1).required(),
            objectType: Joi.string().trim().min(1).required(),
            definition: Joi.object({
                name: Joi.object({
                    "en-US": Joi.string().trim().min(1).required()
                }).required()
            }).required()
        }).required(),
        context: Joi.object().required(),

    });
    return schema.validate(statement);
}

/// Statement Verbs
const createStatementsVerb = {
    "id-enum": "create-statements",
    display: {
        "en-US": "Created Statements"
    }
};
const updateStatementsVerb = {
    "id-enum": "update-statements",
    display: {
        "en-US": "Updated Statements"
    }
};
const deleteStatementsVerb = {
    "id-enum": "delete-statements",
    display: {
        "en-US": "Deleted Statements"
    }
};

module.exports = {
    statementModel,
    validateCreateStatement,
    validateUpdateStatement,
    createStatementsVerb,
    updateStatementsVerb,
    deleteStatementsVerb,
}