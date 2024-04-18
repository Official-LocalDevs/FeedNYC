const mongoose = require('mongoose')

const rangeSchema = new mongoose.Schema({
    open:{
        type: String,
        required: true
    },
    close: {
        type: String,
        required: true
    }
})

module.exports = rangeSchema