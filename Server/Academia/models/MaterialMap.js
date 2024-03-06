const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// MaterialMap Schema
const materialMapSchema = new mongoose.Schema({
    _id: {
        type: String,
        unique: true,
        default: uuidv4,
    },
    materialType: {
        type: Number,
        required: true,
    },
    materialUrl: {
        type: String,
        required: true,
        trim: true,
    },
    materialDescription: {
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
    collection: 'MaterialMap',
});

/// MaterialMap Model
const materialMapModel = mongoose.model('MaterialMap', materialMapSchema);

/// MaterialMap Validation
function validateCreateMaterialMap(materialMap) {
    const schema = Joi.object({
        materialType: {
            type: Joi.number().required(),
        },
        materialUrl: {
            type: Joi.string().required().trim(),
        },
        materialDescription: {
            type: Joi.string().required().trim(),
        },
    });
    return schema.validate(materialMap);
}
function validateUpdateMaterialMap(materialMap) {
    const schema = Joi.object({
        materialType: {
            type: Joi.number().required(),
        },
        materialUrl: {
            type: Joi.string().required().trim(),
        },
        materialDescription: {
            type: Joi.string().required().trim(),
        },
    });
    return schema.validate(materialMap);
}

/// MaterialMap Verbs
const createMaterialMapVerb = {
    "id-enum": "create-material-map",
    display: {
        "en-US": "Created Material Map"
    }
};
const updateMaterialMapVerb = {
    "id-enum": "update-material-map",
    display: {
        "en-US": "Updated Material Map"
    }
};
const deleteMaterialMapVerb = {
    "id-enum": "delete-material-map",
    display: {
        "en-US": "Deleted Material Map"
    }
};

module.exports = {
    materialMapModel,
    validateCreateMaterialMap,
    validateUpdateMaterialMap,
    createMaterialMapVerb,
    updateMaterialMapVerb,
    deleteMaterialMapVerb,
}