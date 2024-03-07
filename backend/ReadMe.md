# Feed NYC Backend

## Setup
1. Run `npm install` to install dependencies
2. Create `.env` files and place secret keys inside it
3. Run `nodemon server.js` to run the server

### Environment Varibles
`MONGODB_URI` - Connection URI to Mongo DB database
`PORT` - Port number where server will run

## Routes
- `api/places/` - Gets all places
- `api/places/:id` - Gets place by ID
- `api/places/borough/:borough` - Gets place by borough