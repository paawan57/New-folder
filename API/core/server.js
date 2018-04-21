var settings = require("../setting");
var routes = require('../routes/todoListRoutes'); 
var express = require('express');
  app = express();
var session = require('express-session');
var bodyParser = require('body-parser');
var path=require('path');
var mysql = require('mysql');
var fs = require('fs');
var formidable = require('formidable');
var $=require('jquery');
var Sync=require('sync');
var urlencodedParser = bodyParser.urlencoded({ extended: false })
console.log(__dirname);
app.set('views', __dirname + '/views');
app.engine('.html', require('ejs').renderFile);
var path = require('path');
app.use(express.static(path.join(__dirname, '/public')));
app.use(session({secret: 'ssshhs'}));

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());



routes.route(app); 


app.listen(settings.webPort);


console.log('todo list RESTful API server started on: ' + settings.webPort);