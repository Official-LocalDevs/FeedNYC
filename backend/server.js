const express = require("express");
const mongoose = require("mongoose");
require('dotenv').config()

const app = express();
app.use(express.json());

const placeRoutes = require("./routes/placeRoutes");

//connecting to mongo
mongoose
  .connect(process.env.MONGODB_URI)
  .then(() => console.log("MongoDB Connected"))
  .catch((err) => console.log(err));

app.use("/api/places", placeRoutes);

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Server is running on port ${port}`));
