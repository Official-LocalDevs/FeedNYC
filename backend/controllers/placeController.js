//this files contains all the functions that are used in placeRoutes.js
let Place = require('../models/Place');

//Endpoint to getall
const getPlaces = async (req, res) => {
  try {
    const places = await Place.find();
    res.json(places);
  } catch (err) {
    console.log(error);
    res.status(500).send("Internal Server Error");
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
    console.log(error);
    res.status(500).send("Internal Server Error");
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

const getPlaceByTag = async (req, res) => {
  const tags = req.params.tags.split(","); // Assuming tags are passed as comma-separated values in the URL
  try {
    const places = await Place.find({ tags: { $in: tags } });
    if (places.length > 0) {
      res.json(places);
    } else {
      res.status(404).send("Places not found");
    }
  } catch (error) {
    console.log(error);
    res.status(500).send("Internal Server Error");
  }
}

const getPlaceByType = async(req,res) => {
  const type = req.params.type;

  try{
    const places = await Place.find({[`hours.${type}`] : { $exists: true }})
    if (places.length > 0) {
      res.json(places);
    } else {
      res.status(404).send("Places not found");
    }
  }catch(error){
    console.log(error);
    res.status(500).send("Internal Server Error");
  }
}

//time range query
const getPlaceByTime = async (req, res) => {
  const open = req.params.open;
  const close = req.params.close;
  try {
    const daysOfWeek = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    const query = {
      $or: []
    };

    daysOfWeek.forEach(day => {
      const dayQuery = {
        [`hours.food_pantry.${day}`]: {
          $elemMatch: {
            open: { $gte: open },
            close: { $lte: close }
          }
        }
      };
      query.$or.push(dayQuery);

      const soupKitchenQuery = {
        [`hours.soup_kitchen.${day}`]: {
          $elemMatch: {
            open: { $gte: open },
            close: { $lte: close }
          }
        }
      };
      query.$or.push(soupKitchenQuery);
    });

    const places = await Place.find(query);

    if (places.length > 0) {
      res.json(places);
    } else {
      res.status(404).send("Place not found");
    }
  } catch (err) {
    console.log(error);
    res.status(500).send("Internal Server Error");
  }
}

const getPlaceByDays = async (req, res) => {
  const requestedDays = req.params.days.split(','); // Split days string into an array
  
  try {
    const query = {
      $or: []
    };

    // Loop through each requested day
    requestedDays.forEach(day => {
      const pantryQuery = {
        [`hours.food_pantry.${day}`]: { $exists: true }
      };
      query.$or.push(pantryQuery);

      const soupKitchenQuery = {
        [`hours.soup_kitchen.${day}`]: { $exists: true }
      };
      query.$or.push(soupKitchenQuery);
    });

    const places = await Place.find(query);

    if (places.length > 0) {
      res.json(places);
    } else {
      res.status(404).send("Places not found");
    }

  } catch (error) {
    console.log(error);
    res.status(500).send("Internal Server Error");
  }
};

//fuzzy search
const getPlaceByName = async (req, res) => {
  const name = req.query.name;
  try {
    // Use a regular expression to perform a fuzzy search
    const places = await Place.find({ name: { $regex: new RegExp(name, "i") } });

    if (places.length > 0) {
      res.json(places);
    } else {
      res.status(404).send("Place not found");
    }
  } catch (err) {
    console.log(error);
    res.status(500).send("Internal Server Error");
  }
}

module.exports = {
  getPlaces,
  getPlaceById, 
  getPlacesByBorough,
  getPlaceByTag, 
  getPlaceByType,
  getPlaceByTime,
  getPlaceByDays,
  getPlaceByName
};