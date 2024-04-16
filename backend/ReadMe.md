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
mongodb+srv://<USERNAME>:<PASSWORD>@<APP_NAME>.zhgcfji.mongodb.net/<DATABASE_NAME>?retryWrites=true&w=majority&appName=<APP_NAME>"
```
`PORT` - Port number where server will run (optional)

## Routes
- `api/places/` - Gets all places
- `api/places/:id` - Gets place by ID
- `api/places/borough/:borough` - Gets place by borough