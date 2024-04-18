const mongoose = require('mongoose')

const noteSchema = new mongoose.Schema({
    for:{
        type: String,
        required: true
    },
    note: {
        type: String,
        required: true
    }
})

module.exports = noteSchema