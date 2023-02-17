const express = require('express');
const app = express();
app.use(express.static(__dirname + '/src'));

app.get('/', function(req, res) {
    res.sendFile(__dirname + '/src/Pages/Home.html');
  });

app.listen(3000, function() {
    console.log('App listening on port 3000!');
});