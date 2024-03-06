const express = require('express');
const asyncHandler = require('express-async-handler'); 
const router = express.Router();  
const model = require('../models/Tickets'); 
const course = require('../models/Course');
const functions = require('../utilities/functions'); 


/** 
    * @desc get all tickets 
    * @route GET /api/tickets 
    * @method GET 
    * @access Public
*/ 
router.get('/', asyncHandler(async (req, res) => { 
    const tickets = await model.ticketModel.find();
    res.status(200).json(tickets);
} )); 


/** 
    * @desc get a ticket by id 
    * @route GET /api/tickets/:id 
    * @method GET 
    * @access Public
*/ 
router.get('/:id', asyncHandler(async (req, res) => {
    const ticket = await model.ticketModel.findById(req.params.id);
    if (ticket) {
        res.status(200).json(ticket);
    } else {
        res.status(404).json({ message: 'Ticket not found' });
    }
})); 


/** 
    * @desc create a ticket 
    * @route POST /api/tickets 
    * @method POST 
    * @access Public
*/ 
router.post('/', asyncHandler(async (req, res) => {
    // validate the course exists 
    const isCourse = await course.courseModel.findById(req.body.courseId);
    if (!isCourse) {
        return res.status(400).json({ message: 'Course not found' });
    } 
    // validate the request 
    const { error } = model.validateCreateTicket(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // create ticket 
    const ticket = await model.ticketModel.create(req.body); 
    res.status(201).json(ticket);
})); 


/** 
    * @desc update a ticket 
    * @route PUT /api/tickets/:id 
    * @method PUT 
    * @access Public
*/ 
router.put('/:id', asyncHandler(async (req, res) => {
    // validate the request 
    const { error } = model.validateUpdateTicket(req.body); 
    if (error) {
        return res.status(400).json({ error: error.details[0].message });
    } 
    // update ticket 
    const ticket = await model.ticketModel.findByIdAndUpdate(req.params.id, req.body, { new: true }); 
    if (ticket) {
        res.status(200).json(ticket);
    } else {
        res.status(404).json({ message: 'Ticket not found' });
    }
})); 


/** 
    * @desc delete a ticket 
    * @route DELETE /api/tickets/:id 
    * @method DELETE 
    * @access Public
*/ 
router.delete('/:id', asyncHandler(async (req, res) => {
    // delete ticket 
    const ticket = await model.ticketModel.findByIdAndDelete(req.params.id); 
    if (ticket) {
        res.status(200).json({ message: 'Ticket deleted successfully' });
    } else {
        res.status(404).json({ message: 'Ticket not found' });
    }
}));


module.exports = router;