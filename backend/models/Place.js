const mongoose = require('mongoose')
const hourSchema = require('./Hour.js')

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
    type: {
        type: String,
        enum: ['Food Pantry', 'Soup Kitchen', 'Food Bank', 'Free Groceries'],
        required: true,
    },
    borough: {
        type: String,
        enum: ['Manhattan', 'Brooklyn', 'Queens', 'Bronx', 'Staten Island'],
        required: true,
    },
    tags: {
        type: [String],
        enum: ['Halal', 'Vegetarian', 'Kosher']
    },
    description: {
        type: String,
        maxLength: 500
    },
    contact: {
        type: String,
        required: true
    },
    hours: {
        type: hourSchema,
        required: true
    }
})

module.exports = mongoose.model('place', placeSchema)