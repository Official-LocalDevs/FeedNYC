const mongoose = require('mongoose')
const hourSchema = require('./Hour.js')
const noteSchema = require('./Note.js')

const placeSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
    },
    address: {
        type: String,
        unique: true,
        required: true,
    },
    contact: {
        type: String,
        required: true
    },
    borough: {
        type: String,
        enum: ['Manhattan', 'Brooklyn', 'Queens', 'Bronx', 'Staten Island'],
        required: true,
    },
    tags: {
        type: [String],
        enum: ['Halal', 'Vegetarian', 'Kosher', 'HIV Customers'],
        required: true,
        default: []
    },
    hours: {
        type: hourSchema
    },
    notes:{
        type: [noteSchema]   
    }
})

module.exports = mongoose.model('place', placeSchema)