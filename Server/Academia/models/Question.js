const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// Question Schema
const questionSchema = new mongoose.Schema({
    _id: {
        type: String,
        unique: true,
        default: uuidv4,
    },
    quizId: {
        type: String,
        required: true,
        trim: true,
        ref: 'Quiz',
    },
    question: {
        type: String,
        required: true,
        trim: true,
        minlength: 1,
        maxlength: 1000,
    },
    options: {
        type: [String],
        required: true,
    },
    correctAnswer: {
        type: String,
        required: true,
        trim: true,
    },
    multipleAnswers: {
        type: Boolean,
        default: false,
    },
    correctAnswers: {
        type: [String],
        default: [],
    },
    weight: {
        type: Number,
        required: true,
        min: 0,
    },
}, {    _id: false,

    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'createdOn',
        updatedAt: 'editedOn',
    },
    collection: 'Questions',
});

/// QuizQuestion Model
const questionModel = mongoose.model('Question', questionSchema);

/// QuizQuestion Validation
function validateCreateQuestion(quizQuestion) {
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
            question: {
                question: Joi.string().min(1).max(1000).required(),
                quizId: Joi.string().required(),
                options: Joi.array().items(Joi.string()).required(),
                correctAnswer: Joi.string().required().custom((value, helpers) => {
                    const { options } = quizQuestion.context.question;

                    if (!options.includes(value)) {
                        return helpers.error('any.invalid', { message: 'Correct answer must be one of the provided options' });
                    }
                    return value;
                }),
                multipleAnswers: Joi.boolean(),
                correctAnswers: Joi.array().items(Joi.string()).custom((value, helpers) => {
                    const { options, multipleAnswers } = quizQuestion.context.question;
                    if (multipleAnswers) {
                        if (value.length < 2) {
                            return helpers.error('any.invalid', { message: 'Multiple correct answers must be provided' });
                        }
                        if (value.length > options.length) {
                            return helpers.error('any.invalid', { message: 'Multiple correct answers cannot be more than the provided options' });
                        }
                        if (value.some(answer => !options.includes(answer))) {
                            return helpers.error('any.invalid', { message: 'Multiple correct answers must be one of the provided options' });
                        }
                    }
                    return value;
                }),
                weight: Joi.number().min(0).required(),
            }
        }
    });

    return schema.validate(quizQuestion);
}

function validateUpdateQuestion(quizQuestion) {
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
            question: {
                question: Joi.string().min(1).max(1000),
                options: Joi.array().items(Joi.string()),
                correctAnswer: Joi.string().custom((value, helpers) => {
                    const { options } = quizQuestion.context.question;

                    if (!options.includes(value)) {
                        return helpers.error('any.invalid', { message: 'Correct answer must be one of the provided options' });
                    }
                    return value;
                }),
                multipleAnswers: Joi.boolean(),
                correctAnswers: Joi.array().items(Joi.string()).custom((value, helpers) => {
                    const { options, multipleAnswers } = quizQuestion.context.question;
                    if (multipleAnswers) {
                        if (value.length < 2) {
                            return helpers.error('any.invalid', { message: 'Multiple correct answers must be provided' });
                        }
                        if (value.length > options.length) {
                            return helpers.error('any.invalid', { message: 'Multiple correct answers cannot be more than the provided options' });
                        }
                        if (value.some(answer => !options.includes(answer))) {
                            return helpers.error('any.invalid', { message: 'Multiple correct answers must be one of the provided options' });
                        }
                    }
                    return value;
                }),
                weight: Joi.number().min(0),
            }
        }
    });

    return schema.validate(quizQuestion);
}

/// Question Verbs
const createQuestionVerb = {
    "id-enum": "create-question",
    display: {
        "en-US": "Created Question"
    }
};
const updateQuestionVerb = {
    "id-enum": "update-question",
    display: {
        "en-US": "Updated Question"
    }
};
const deleteQuestionVerb = {
    "id-enum": "delete-question",
    display: {
        "en-US": "Deleted Question"
    }
};

module.exports = {
    questionModel,
    validateCreateQuestion,
    validateUpdateQuestion,
    createQuestionVerb,
    updateQuestionVerb,
    deleteQuestionVerb,
};