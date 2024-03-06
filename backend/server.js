//needed modules
const express = require("express");
const mongoose = require("mongoose");
const keys = require("./config/keys");

//import models
const Place = require("./models/Place");

const app = express();
// parse JSON requests
app.use(express.json());

//connecting to mongo
mongoose
  .connect(keys.mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log("MongoDB Connected"))
  .catch((err) => console.log(err));

//Endpoint to getall
app.get("/getall", async (req, res) => {
  try {
    const places = await Place.find();
    res.json(places);
  } catch (err) {
    res.status(500).send(err.message);
  }
});
//Endpoint to get place by ID
app.get("/id/:id", async (req, res) => {
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
});
