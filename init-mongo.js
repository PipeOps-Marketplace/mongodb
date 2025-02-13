const username = process.env.MONGO_INITDB_ROOT_USERNAME;
const password = process.env.MONGO_INITDB_ROOT_PASSWORD;
const database = process.env.MONGO_INITDB_DATABASE;

db = db.getSiblingDB("admin"); // Switch to the specified database

db.createUser({
  user: username,
  pwd: password,
  roles: [
    { role: "readWrite", db: database },
    { role: "dbAdmin", db: database },
    { role: "userAdmin", db: database }
  ]
});
