const mongoose = require('mongoose')

const hourSchema = new mongoose.Schema({
    Monday: {
        open: String,
        close: String
    },
    Tuesday: {
        open: String,
        close: String
    },
    Wednesday: {
        open: String,
        close: String
    },
    Thursday: {
        open: String,
        close: String
    },
    Friday: {
        open: String,
        close: String
    },
    Saturday: {
        open: String,
        close: String
    },
    Sunday: {
        open: String,
        close: String
    }
});

module.exports =  hourSchema