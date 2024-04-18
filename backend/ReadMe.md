# Feed NYC Backend

## Setup
1. Navigate to this backend folder in the terminal
2. Run `npm install` to install dependencies
3. Create `.env` file and place secret keys inside it
4. Run `nodemon server` to run the server
    - If nodemon does not work, you can use `node server` instead

### Environment Varibles
`MONGODB_URI` - Connection URI to Mongo DB database
```
# Uri Template
mongodb+srv://<USERNAME>:<PASSWORD>@<APP_NAME>.zhgcfji.mongodb.net/<DATABASE_NAME>?retryWrites=true&w=majority&appName=<APP_NAME>"
```
`PORT` - Port number where server will run (optional)

## Routes
- `api/places/getAll` - Gets all places
- `api/places/id/:id` - Gets place by ID
- `api/places/borough/:borough` - Gets place by borough 
    - enum: [ Brooklyn, Bronx, Queens, Manhattan, Staten Island ]
    - borough name must have proper capitalization
- `api/places/tags/:tags` - Gets place by tags
    - enum: [ Halal, Kosher, HIV Customers, Mobile ]
    - Returns all places with at least one of the queried tags
    - Must separate all tags by a comma `Halal,Kosher,Mobile`
- `api/places/type/:type` - Gets place by type 
    - enum: [ soup_kitchen, food_pantry ]
- `api/places/time/:open/:close` - Gets place by time range
- `api/places/days/:days` - Gets place by day of the week 
    - enum: [ Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday ]
    - can add multiple days using a comma. ex: Monday, Tuesday
- `api/places/search` - Fuzzy search by name
    - query params: `name` 