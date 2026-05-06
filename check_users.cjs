const sqlite3 = require('sqlite3').verbose();
const db = new sqlite3.Database('./probase.db');

db.all("SELECT * FROM users", [], (err, rows) => {
  if (err) throw err;
  console.log(JSON.stringify(rows, null, 2));
  db.close();
});
