const mongoose = require('mongoose')
const rangeSchema = require('./Range.js')

const hourSchema = new mongoose.Schema({
    food_pantry: {
        Monday: {
            type: [rangeSchema],
            default:undefined
        },
        Tuesday: {
            type: [rangeSchema],
            default:undefined
        },
        Wednesday: {
            type: [rangeSchema],
            default:undefined
        },
        Thursday: {
            type: [rangeSchema],
            default:undefined
        },
        Friday: {
            type: [rangeSchema],
            default:undefined
        },
        Saturday: {
            type: [rangeSchema],
            default:undefined
        },
        Sunday: {
            type: [rangeSchema],
            default:undefined
        }
    },
    soup_kitchen: {
        Monday: {
            type: [rangeSchema],
            default:undefined
        },
        Tuesday: {
            type: [rangeSchema],
            default:undefined
        },
        Wednesday: {
            type: [rangeSchema],
            default:undefined
        },
        Thursday: {
            type: [rangeSchema],
            default:undefined
        },
        Friday: {
            type: [rangeSchema],
            default:undefined
        },
        Saturday: {
            type: [rangeSchema],
            default:undefined
        },
        Sunday: {
            type: [rangeSchema],
            default:undefined
        }
    }
});

module.exports =  hourSchema