exports.route = function(app) {
  var todoList = require('../controllers/aadhar');


  app.route('/AADHAR_API/:aadharNO')
    .get(todoList.detail_of_aadhar)
    
};