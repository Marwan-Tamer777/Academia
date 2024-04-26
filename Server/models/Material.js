const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// Material Schema
const materialSchema = new mongoose.Schema({
    _id: {
        type: String,
        unique: true,
        default: uuidv4,
    },
    courseId: {
        type: String,
        required: true,
        trim: true,
        ref: 'Course',
    },
    materialName: {
        type: String,
        required: true,
        trim: true,
        minlength: 1,
        maxlength: 100,
    },
    materialTypeCode: {
        type: Number,
        required: true,
        unique: false,
    },
    description: {
        type: String,
        required: true,
        trim: true,
        minlength: 1,
    },
    link: {
        type: String,
        required: true,
        trim: true,
        minlength: 1,
    },
    tags: {
        type: [String],
        default: [],
    },
}, {    _id: false,

    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
    collection: 'Materials',
});

/// Material Model
const materialModel = mongoose.model('Material', materialSchema);

/// Material Validation
function validateCreateMaterial(material) {
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
            material: {
                id: Joi.string(),
                courseId: Joi.string().required(),
                materialName: Joi.string().min(1).max(100).required(),
                materialTypeCode: Joi.number().required(),
                description: Joi.string().min(1).required(),
                link: Joi.string().min(1).required(),
                tags: Joi.array().items(Joi.string()),
            }
        }
    });
    return schema.validate(material);
}

function validateUpdateMaterial(material) {
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
            material: {
                id: Joi.string(),
                courseId: Joi.string(),
                materialName: Joi.string().min(1).max(100),
                materialTypeCode: Joi.number(),
                description: Joi.string().min(1),
                link: Joi.string().min(1),
                tags: Joi.array().items(Joi.string()),
            }
        }
    });
    return schema.validate(material);
}

/// Material Verbs
const createMaterialVerb = {
    "id-enum": "create-material",
    display: {
        "en-US": "Created Material"
    }
};
const updateMaterialVerb = {
    "id-enum": "update-material",
    display: {
        "en-US": "Updated Material"
    }
};
const deleteMaterialVerb = {
    "id-enum": "delete-material",
    display: {
        "en-US": "Deleted Material"
    }
};
module.exports = {
    materialModel,
    validateCreateMaterial,
    validateUpdateMaterial,
    createMaterialVerb,
    updateMaterialVerb,
    deleteMaterialVerb,
};