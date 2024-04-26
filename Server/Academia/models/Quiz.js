const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// Quiz Schema
const quizSchema = new mongoose.Schema({
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
    quizName: {
        type: String,
        required: true,
        trim: true,
        minlength: 1,
        maxlength: 100,
    },
    questions: {
        type: [String],
        default: [],
    },
    numOfRetries: {
        type: Number,
        required: true,
        min: 0,
    },
    duration: {
        type: String,
        required: true,
        min: 0,
    },
    startDate: {
        type: String,
        required: true,
    },
    endDate: {
        type: String,
        required: true,
    },
    showGrade: {
        type: Boolean,
        required: true,
    },
    showWrongAnswers: {
        type: Boolean,
        required: true,
    },
    showCorrectAnswers: {
        type: Boolean,
        required: true,
    },

}, {    _id: false,

    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
    collection: 'Quiz',
});

/// Quiz Model
const quizModel = mongoose.model('Quiz', quizSchema);

/// Quiz Validation
function validateCreateQuiz(quiz) {
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
            quiz: {
                courseId: Joi.string().required(),
                quizName: Joi.string().min(1).max(100).required(),
                questions: Joi.array().items(Joi.string()),
                numOfRetries: Joi.number().required(),
                duration: Joi.string().required(),
                startDate: Joi.string().required(),
                endDate: Joi.string().required(),
                showGrade: Joi.boolean().required(),
                showWrongAnswers: Joi.boolean().required(),
                showCorrectAnswers: Joi.boolean().required(),
            }
        }
    });
    return schema.validate(quiz);
}

function validateUpdateQuiz(quiz) {
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
            quiz: {
                quizName: Joi.string().min(1).max(100),
                questions: Joi.array().items(Joi.string()),
                numOfRetries: Joi.number(),
                duration: Joi.string(),
                startDate: Joi.string(),
                endDate: Joi.string(),
                showGrade: Joi.boolean(),
                showWrongAnswers: Joi.boolean(),
                showCorrectAnswers: Joi.boolean(),
            }
        }
    });
    return schema.validate(quiz);
}

/// Quiz Verbs
const createQuizVerb = {
    "id-enum": "create-quiz",
    display: {
        "en-US": "Created Quiz"
    }
};
const updateQuizVerb = {
    "id-enum": "update-quiz",
    display: {
        "en-US": "Updated Quiz"
    }
};
const deleteQuizVerb = {
    "id-enum": "delete-quiz",
    display: {
        "en-US": "Deleted Quiz"
    }
};

module.exports = {
    quizModel,
    validateCreateQuiz,
    validateUpdateQuiz,
    createQuizVerb,
    updateQuizVerb,
    deleteQuizVerb,
};