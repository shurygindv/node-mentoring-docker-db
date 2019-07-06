const { Client } = require('pg')

const CONNECTION_STRING = 'postgres://test:test1234@localhost:7654/pg-db-test';

const client = new Client(CONNECTION_STRING);

(async () => {
  await client.connect();
  
  client.query('SELECT * FROM Users ORDER BY id ASC', (err, res) => {
    if (err) {
      console.log('ERROR: ', err);
    } else {
      console.log(res.rows);
    }
    client.end();
  });
})()

