const mongoose = require("mongoose");

const Place = require("./Place.js");
const keys = require("./keys.json");

mongoose.connect(keys.mongoURI);

//create new place
// new Place({
//     name: 'Halal Guys',
//     address: '123 Main St',
//     borough: 'Brooklyn',
//     tags: ['Halal', 'Vegetarian'],
//     type: 'Food Pantry',
//     contact: '123-456-7890',
//     hours: {
//         Monday: {
//             open: '12:00',
//             close: '18:00'
//         },
//         Tuesday: {
//             open: '8:00',
//             close: '17:00'
//         }
//     }
// }).save()
// .then(
//     console.log('saved')
// )

// create another new place
// new Place({
//     name: 'Another Place',
//     address: '456 Elm St',
//     borough: 'Queens',
//     type: 'Soup Kitchen',
//     tags: ['Kosher'],
//     contact: '987-654-3210',
//     hours: {
//         Tuesday: {
//             open: '11:30',
//             close: '21:00'
//         },
//         Thursday: {
//             open: '12:00',
//             close: '20:00'
//         }
//     }
// }).save()
// .then(
//     console.log('saved')
// )

//find all query
// const query = Place.find();

// query.exec()
//   .then(result => {
//     console.log(result);
//   })
//   .catch(err => {
//     console.error(err);
//   });

//find by id (example object id used)
// const idQuery = Place.find({_id:'65e661579ceecf2557ce17f4'});

// idQuery.exec()
//   .then(result => {
//     console.log(result);
//   })
//   .catch(err => {
//     console.error(err);
//   });

// find by borough example
// const boroughQuery = Place.find({'borough': 'Brooklyn'});

// boroughQuery.exec()
//   .then(result => {
//     console.log(result);
//   })
//   .catch(err => {
//     console.error(err);
//   });

//find by type example
// const typeQuery = Place.find({'type': 'Soup Kitchen'});

// typeQuery.exec()
//   .then(result => {
//     console.log(result);
//   })
//   .catch(err => {
//     console.error(err);
//   });

// search if there is a day (uses Tuesday as an example)
// const dayToCheck = "Tuesday";
// const dayExistsQuery = Place.find({ [`hours.${dayToCheck}`]: { $exists: true } });

// dayExistsQuery.exec()
//   .then(results => {
//     console.log(results);
//   })
//   .catch(err => {
//     console.error(err);
//   });

// example time range query
// const start = "12:00";
// const end = "13:00";
// const timeRangeQuery = Place.find({
//     $or: [
//         { "hours.Monday.open": { $lte: start }, "hours.Monday.close": { $gte: end } },
//         { "hours.Tuesday.open": { $lte: start }, "hours.Tuesday.close": { $gte: end } },
//         { "hours.Wednesday.open": { $lte: start }, "hours.Wednesday.close": { $gte: end } },
//         { "hours.Thursday.open": { $lte: start }, "hours.Thursday.close": { $gte: end } },
//         { "hours.Friday.open": { $lte: start }, "hours.Friday.close": { $gte: end } },
//         { "hours.Saturday.open": { $lte: start }, "hours.Saturday.close": { $gte: end } },
//         { "hours.Sunday.open": { $lte: start }, "hours.Sunday.close": { $gte: end } }
//     ]
// });

// timeRangeQuery.exec()
//   .then(result => {
//     console.log(result);
//   })
//   .catch(err => {
//     console.error(err);
//   });
