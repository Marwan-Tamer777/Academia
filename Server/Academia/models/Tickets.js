const mongoose = require('mongoose');
const Joi = require('joi');
const { v4: uuidv4 } = require('uuid');

/// Ticket Schema
const ticketSchema = new mongoose.Schema({
    _id: {
        type: String,
        default: uuidv4,
        unique: true,
    },
    courseId: {
        type: String,
        required: true,
        trim: true,
    },
    submittedBy: {
        type: String,
        required: true,
        trim: true,
    },
    details: {
        type: [String],
        required: true,
        trim: true,
    },
    status: {
        type: String,
        required: true,
        enum: ['Pending','Open', 'In Progress', 'Resolved', 'Closed'],
        trim: true,
    },
    adminResponses: {
        type: [String],
        default: [],
    },
    attachments: {
        type: [String],
        default: [],
    },
    assignedTo: {
        type: String,
        default: "",
    },
    priority: {
        type: String,
        required: true,
        trim: true,
        enum: ['Low', 'Medium', 'High'],
    },
}, {
    _id: false,
    timestamps: {
        currentTime: () => new Date().toISOString(), // Use ISO 8601 format for timestamps
        createdAt: 'SubmittedOn',
        updatedAt: 'editedOn',
    },
    collection: 'Tickets',
});

/// Ticket Model
const ticketModel = mongoose.model('Ticket', ticketSchema);

/// Validate Ticket
function validateCreateTicket(ticket) {
    const schema = Joi.object({
        courseId: Joi.string().required(),
        submittedBy: Joi.string().required(),
        details: Joi.array().items(Joi.string()).required(),
        status: Joi.string().required(),
        adminResponses: Joi.array().items(Joi.string()),
        attachments: Joi.array().items(Joi.string()),
        assignedTo: Joi.string(),
        priority: Joi.string().required(),
    });

    return schema.validate(ticket);
}


function validateUpdateTicket(ticket) {
    const schema = Joi.object({
        courseId: Joi.string(),
        submittedBy: Joi.string(),
        details: Joi.array().items(Joi.string()),
        status: Joi.string(),
        adminResponses: Joi.array().items(Joi.string()),
        attachments: Joi.array().items(Joi.string()),
        assignedTo: Joi.string(),
        priority: Joi.string(),
    });

    return schema.validate(ticket);
}

/// Ticket Verbs
const createTicketVerb = {
    "id-enum": "create-ticket",
    display: {
        "en-US": "Created Ticket"
    }
};

const updateTicketVerb = {
    "id-enum": "update-ticket",
    display: {
        "en-US": "Updated Ticket"
    }
};

const deleteTicketVerb = {
    "id-enum": "delete-ticket",
    display: {
        "en-US": "Deleted Ticket"
    }
};

module.exports = {
    ticketModel,
    validateCreateTicket,
    validateUpdateTicket,
    createTicketVerb,
    updateTicketVerb,
    deleteTicketVerb,
}
