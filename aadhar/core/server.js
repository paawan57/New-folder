var settings = require("../setting");
var routes = require('../routes/todoListRoutes'); 
var express = require('express'),
  app = express(),
  bodyParser = require('body-parser');


app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());



routes.route(app); 


app.listen(settings.webPort);


console.log('todo list RESTful API server started on: ' + settings.webPort);