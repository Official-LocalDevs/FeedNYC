const router = require('express').Router();
let Place = require('../models/Place');
const {getPlaces, getPlaceById, getPlacesByBorough} = require('../controllers/placeController');

//Endpoint to getall
router.get("/", getPlaces);
  
//Endpoint to get place by ID
router.get("/:id", getPlaceById);
  
//Endpoint to get place by borough
router.get("/borough/:borough", getPlacesByBorough);

module.exports = router;