const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// QuizUserInfo Schema
const quizUserInfoSchema = new mongoose.Schema({
    _id: {
        type: String,
        unique: true,
        default: uuidv4,
    },
    quizId: {
        type: String,
        required: true,
        trim: true,
    },
    userId: {
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
    collection: 'QuizUserInfo',
});

/// QuizUserInfo Model
const quizUserInfoModel = mongoose.model('QuizUserInfo', quizUserInfoSchema);

/// QuizUserInfo Validation
function validateCreateQuizUserInfo(quizUserInfo) {
    const schema = Joi.object({
        quizId: {
            type: Joi.string().required().trim(),
        },
        userId: {
            type: Joi.string().required().trim(),
        },
        courseId: {
            type: Joi.string().required().trim(),
        },
        submissionUrl: {
            type: Joi.string().required().trim(),
        },
        showGrade: {
            type: Joi.boolean().required(),
        },
        grade: {
            type: Joi.number().required(),
        },
        maxGrade: {
            type: Joi.number().required(),
        },
    });
    return schema.validate(quizUserInfo);
}
function validateUpdateQuizUserInfo(quizUserInfo) {
    const schema = Joi.object({
        quizId: {
            type: Joi.string().required().trim(),
        },
        userId: {
            type: Joi.string().required().trim(),
        },
        courseId: {
            type: Joi.string().required().trim(),
        },
        submissionUrl: {
            type: Joi.string().required().trim(),
        },
        showGrade: {
            type: Joi.boolean().required(),
        },
        grade: {
            type: Joi.number().required(),
        },
        maxGrade: {
            type: Joi.number().required(),
        },
    });
    return schema.validate(quizUserInfo);
}

/// QuizUserInfo Verbs
const createQuizUserInfoVerb = {
    "id-enum": "create-quiz-user-info",
    display: {
        "en-US": "Created Quiz User Info"
    }
};
const updateQuizUserInfoVerb = {
    "id-enum": "update-quiz-user-info",
    display: {
        "en-US": "Updated Quiz User Info"
    }
};
const deleteQuizUserInfoVerb = {
    "id-enum": "delete-quiz-user-info",
    display: {
        "en-US": "Deleted Quiz User Info"
    }
};

module.exports.QuizUserInfo = {
    quizUserInfoModel,
    validateCreateQuizUserInfo,
    validateUpdateQuizUserInfo,
    createQuizUserInfoVerb,
    updateQuizUserInfoVerb,
    deleteQuizUserInfoVerb,
}