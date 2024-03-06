const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// Statement Schema
const statementSchema = new mongoose.Schema({
    _id: {
        type: String,
        unique: true,
        default: uuidv4,
    },
    actor: {
        type: String,
        required: true,
        trim: true,
    },
    action: {
        type: String,
        required: true,
        trim: true,
    },
    context: {
        type: String,
        required: true,
        trim: true,
    },
    object : {
        type: String,
        required: true,
        trim: true,
    },
    timestamp: {
        type: Date,
        default: new Date().toISOString(),
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
        actor: {
            type: Joi.string().required().trim(),
        },
        action: {
            type: Joi.string().required().trim(),
        },
        context: {
            type: Joi.string().required().trim(),
        },
        object: {
            type: Joi.string().required().trim(),
        },
    });
    return schema.validate(statement);
}

function validateUpdateStatement(statement) {
    const schema = Joi.object({
        actor: {
            type: Joi.string().required().trim(),
        },
        action: {
            type: Joi.string().required().trim(),
        },
        context: {
            type: Joi.string().required().trim(),
        },
        object: {
            type: Joi.string().required().trim(),
        },
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