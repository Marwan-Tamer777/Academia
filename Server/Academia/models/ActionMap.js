const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// ActionMap Schema
const actionMapSchema = new mongoose.Schema({
    _id: {
        type: String,
        unique: true,
        default: uuidv4,
    },
    description: {
        type: String,
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
    collection: 'ActionMap',
});

/// ActionMap Model
const actionMapModel = mongoose.model('ActionMap', actionMapSchema);

/// ActionMap Validation
function validateCreateActionMap(actionMap) {
    const schema = Joi.object({
        actor: {
            name: Joi.string().trim().min(1).required(),
            id: Joi.string().trim().min(1).required(),
        },
        verb: {
            "id-enum": Joi.string().trim().min(1).required(),
            display: {
                "en-US": Joi.string().trim().min(1).required()
            }
        },
        object: {
            id: Joi.string().trim().min(1).required(),
            objectType: Joi.string().trim().min(1).required(),
            definition: {
                name: {
                    "en-US": Joi.string().trim().min(1).required()
                }
            }
        },
        context: {
            actionMap: {
                description: Joi.string().required().trim(),
            }
        }

    });
    return schema.validate(actionMap);
}
function validateUpdateActionMap(actionMap) {
    const schema = Joi.object({
        description: {
            type: Joi.string().required().trim(),
        },
    });
    return schema.validate(actionMap);
}

/// ActionMap Verbs
const createActionMapVerb = {
    "id-enum": "create-action-map",
    display: {
        "en-US": "Created Action Map"
    }
};
const updateActionMapVerb = {
    "id-enum": "update-action-map",
    display: {
        "en-US": "Updated Action Map"
    }
};
const deleteActionMapVerb = {
    "id-enum": "delete-action-map",
    display: {
        "en-US": "Deleted Action Map"
    }
};

module.exports = {
    actionMapModel,
    validateCreateActionMap,
    validateUpdateActionMap,
    createActionMapVerb,
    updateActionMapVerb,
    deleteActionMapVerb,
}