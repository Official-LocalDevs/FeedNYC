const router = require('express').Router();
const placeController = require('../controllers/placeController');

router.get("/getAll", placeController.getPlaces);
  
router.get("/id/:id", placeController.getPlaceById);

router.get("/borough/:borough", placeController.getPlacesByBorough);

router.get("/tags/:tags", placeController.getPlaceByTag);

router.get("/type/:type", placeController.getPlaceByType);

router.get("/time/:open/:close", placeController.getPlaceByTime);

router.get("/days/:days", placeController.getPlaceByDays)

router.get("/search", placeController.getPlaceByName);

module.exports = router;