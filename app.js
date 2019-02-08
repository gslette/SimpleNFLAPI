//I wanted to automate injestion of the NFL data. 
//But I would have wanted to add a bunch of checks so it was only updating
//or adding data that has changed, so I decided to leave it manual.
//var injest = require('./injest');

var routes = require('./routes/routes');
var bodyParser = require('body-parser');
var express = require('express'),
app = express(),
port = process.env.PORT || 3000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

routes(app);

var server = app.listen(port, function () {
    //injest.injestData();
    console.log('Simple NFL API started on port ' + port + '.');
});