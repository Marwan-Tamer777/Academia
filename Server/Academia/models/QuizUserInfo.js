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
    answers: {
        type: [String],
        default: [],
    },
    retriesLeft: {
        type: Number,
        default: 1,
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
        quizId: Joi.string().required().trim(),

        userId: Joi.string().required().trim(),

        courseId: Joi.string().required().trim(),

        submissionUrl: Joi.string().required().trim(),

        showGrade: Joi.boolean().required(),

        grade: Joi.number().required(),

        maxGrade: Joi.number().required(),
        gradedBy: Joi.string().required().trim(),

    });
    return schema.validate(quizUserInfo);
}
function validateUpdateQuizUserInfo(quizUserInfo) {
    const schema = Joi.object({
        quizId: Joi.string().trim(),

        userId: Joi.string().trim(),

        courseId: Joi.string().trim(),

        submissionUrl: Joi.string().trim(),

        showGrade: Joi.boolean(),

        grade: Joi.number(),

        maxGrade: Joi.number(),
        gradedBy: Joi.string().trim(),
    });
    return schema.validate(quizUserInfo);
}
function validateSubmitQuizUserInfo(quizUserInfo) {
    const schema = Joi.object({
        quizId: Joi.string().required().trim(),

        userId: Joi.string().required().trim(),

        courseId: Joi.string().required().trim(),
        answers: Joi.array().items(Joi.string()).required(),
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
const submitQuizUserInfoVerb = {
    "id-enum": "submit-quiz-user-info",
    display: {
        "en-US": "Submitted Quiz User Info"
    }
};
const deleteQuizUserInfoVerb = {
    "id-enum": "delete-quiz-user-info",
    display: {
        "en-US": "Deleted Quiz User Info"
    }
};

module.exports = {
    quizUserInfoModel,
    validateCreateQuizUserInfo,
    validateUpdateQuizUserInfo,
    validateSubmitQuizUserInfo,
    createQuizUserInfoVerb,
    submitQuizUserInfoVerb,
    updateQuizUserInfoVerb,
    deleteQuizUserInfoVerb,
}