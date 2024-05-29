const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// Assignment Schema
const assignmentSchema = new mongoose.Schema({
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
    description: {
        type: String,
        required: true,
        trim: true,
    },
    closeOn: {
        type: Date,
        required: true,
    },
    duration: {
        type: Number,
        required: true,
    },
    numOfAttempts: {
        type: Number,
        required: true,
    },
}, {
    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
    collection: 'Assignments',
});

/// Assignment Model
const assignmentModel = mongoose.model('Assignment', assignmentSchema);

/// Validate Assignment
function validateCreateAssignment(assignment) {
    const schema = Joi.object({
        // actor: {
        //     name: Joi.string().trim().min(1).required(),
        //     id: Joi.string().trim().min(1).required(),
        // },
        // verb: {
        //     "id-enum": Joi.string().trim().min(1).required(),
        //     display: {
        //         "en-US": Joi.string().trim().min(1).required()
        //     }
        // },
        // object: {
        //     id: Joi.string().trim().min(1).required(),
        //     objectType: Joi.string().trim().min(1).required(),
        //     definition: {
        //         name: {
        //             "en-US": Joi.string().trim().min(1).required()
        //         }
        //     }
        // },
        // context: {
        // assignment: {
        courseId: Joi.string().required(),
        description: Joi.string().required(),
        closeOn: Joi.date().required(),
        duration: Joi.number().required(),
        numOfAttempts: Joi.number().required(),
        // }
        // }

    });

    return schema.validate(assignment);
}

function validateUpdateAssignment(assignment) {
    const schema = Joi.object({
        courseId: Joi.string(),
        description: Joi.string(),
        closeOn: Joi.date(),
        duration: Joi.number(),
        numOfAttempts: Joi.number(),
    });

    return schema.validate(assignment);
}

/// Assignment Verbs
const createAssignmentVerb = {
    "id-enum": "create-assignment",
    display: {
        "en-US": "Created Assignment"
    }
};

const updateAssignmentVerb = {
    "id-enum": "update-assignment",
    display: {
        "en-US": "Updated Assignment"
    }
};

const deleteAssignmentVerb = {
    "id-enum": "delete-assignment",
    display: {
        "en-US": "Deleted Assignment"
    }
};

module.exports = {
    assignmentModel,
    validateCreateAssignment,
    validateUpdateAssignment,
    createAssignmentVerb,
    updateAssignmentVerb,
    deleteAssignmentVerb,
}