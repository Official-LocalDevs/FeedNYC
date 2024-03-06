//needed modules
const express = require("express");
const mongoose = require("mongoose");
const keys = require("./config/keys");

//import models
const Hours = require("./models/Hour");
const Place = require("./models/Place");

const app = express();
// parse JSON requests
app.use(express.json());

//connecting to mongo
mongoose
  .connect(keys.mongoURI, { useNewUrlParser: true, useUnifiedTopology: true })
  .then(() => console.log("MongoDB Connected"))
  .catch((err) => console.log(err));
