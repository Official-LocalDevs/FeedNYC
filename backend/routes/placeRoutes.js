const router = require('express').Router();
const placeController = require('../controllers/placeController');

//Endpoint to getall
router.get("/getAll", placeController.getPlaces);

//Endpoint to get place by ID
router.get("/:id", placeController.getPlaceById);

//Endpoint to get place by borough
router.get("/borough/:borough", placeController.getPlacesByBorough);

module.exports = router;