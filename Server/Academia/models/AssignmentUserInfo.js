const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// AssignmentUserInfo Schema
const assignmentUserInfoSchema = new mongoose.Schema({
    _id: {
        type: String,
        unique: true,
        default: uuidv4,
    },
    assignmentId: {
        type: String,
        required: true,
        trim: true,
    },
    userId: {
        type: String,
        required: true,
        trim: true,
    },
    gradedBy: {
        type: String,
        required: true,
        trim: true,
    },
    courseId: {
        type: String,
        required: true,
        trim: true,
    },
    submissionUrl: {
        type: String,
        required: true,
        trim: true,
    },
    submissionDate: {
        type: Date,
        default: new Date().toISOString(),
    },
    showGrade: {
        type: Boolean,
        required: true,
    },
    grade: {
        type: Number,
        required: true,
    },
    maxGrade: {
        type: Number,
        required: true,
    },
}, {
    _id: false,
    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
    collection: 'AssignmentUserInfo',
});

/// AssignmentUserInfo Model
const assignmentUserInfoModel = mongoose.model('AssignmentUserInfo', assignmentUserInfoSchema);

/// AssignmentUserInfo Validation
function validateCreateAssignmentUserInfo(assignmentUserInfo) {
    const schema = Joi.object({
        assignmentId: Joi.string().required().trim(),
        userId: Joi.string().required().trim(),
        gradedBy: Joi.string().required().trim(),
        courseId: Joi.string().required().trim(),
        submissionUrl: Joi.string().required().trim(),
        submissionDate: Joi.date().required(),
        showGrade: Joi.boolean().required(),
        grade: Joi.number().required(),
        maxGrade: Joi.number().required(),

    });
    return schema.validate(assignmentUserInfo);
}
function validateSubmitAssignmentUserInfo(assignmentUserInfo) {
    const schema = Joi.object({
        assignmentId:
            Joi.string().required().trim(),

        userId: Joi.string().required().trim(),

        courseId: Joi.string().required().trim(),
    });
    return schema.validate(assignmentUserInfo);
}
function validateUpdateAssignmentUserInfo(assignmentUserInfo) {
    const schema = Joi.object({
        assignmentId:
            Joi.string().required().trim(),

        userId: Joi.string().required().trim(),

        gradedBy: Joi.string().required().trim(),

        courseId: Joi.string().required().trim(),

        submissionUrl: Joi.string().required().trim(),

        submissionDate: Joi.date().required(),

        showGrade: Joi.boolean().required(),

        grade: Joi.number().required(),

        maxGrade: Joi.number().required(),

    });
    return schema.validate(assignmentUserInfo);
}



/// AssignmentUserInfo Verbs
const createAssignmentUserInfoVerb = {
    "id-enum": "create-assignment-user-info",
    display: {
        "en-US": "Created Assignment User Info"
    }
};
const submitAssignmentUserInfoVerb = {
    "id-enum": "submit-assignment-user-info",
    display: {
        "en-US": "Submitted Assignment User Info"
    }
};
const updateAssignmentUserInfoVerb = {
    "id-enum": "update-assignment-user-info",
    display: {
        "en-US": "Updated Assignment User Info"
    }
};
const deleteAssignmentUserInfoVerb = {
    "id-enum": "delete-assignment-user-info",
    display: {
        "en-US": "Deleted Assignment User Info"
    }
};

module.exports = {
    assignmentUserInfoModel,
    validateCreateAssignmentUserInfo,
    submitAssignmentUserInfoVerb,
    validateSubmitAssignmentUserInfo,
    validateUpdateAssignmentUserInfo,
    createAssignmentUserInfoVerb,
    updateAssignmentUserInfoVerb,
    deleteAssignmentUserInfoVerb,
}