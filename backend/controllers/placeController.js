//this files contains all the functions that are used in placeRoutes.js

let Place = require('../models/Place');

//Endpoint to getall
const getPlaces = async (req, res) => {
  try {
    const places = await Place.find();
    res.json(places);
  } catch (err) {
    res.status(500).send(err.message);
  }
};

//Endpoint to get place by ID
const getPlaceById = async (req, res) => {
  try {
    const place = await Place.findById(req.params.id);
    if (place) {
      res.json(place);
    } else {
      res.status(404).send("Place not found");
    }
  } catch (err) {
    res.status(500).send(err.message);
  }
};

//Endpoint to get place by borough
const getPlacesByBorough = async (req, res) => {
  try {
    const places = await Place.find({ borough: req.params.borough });
    res.json(places);
  } catch (err) {
    res.status(500).send(err.message);
  }
};

module.exports = { getPlaces, getPlaceById, getPlacesByBorough };