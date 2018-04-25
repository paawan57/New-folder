var db=require("../core/db");
var fs=require('fs');
var jsonLogic=require('json-logic-js');
var bodyParser = require('body-parser');

  var ageCalculator = require('age-calculator');
  let {AgeFromDateString, AgeFromDate} = require('age-calculator');
 
var urlencodedParser = bodyParser.urlencoded({ extended: false })
exports.route = function(app) {
  var todoList = require('../controllers/beneficiars');

  app.route('/welfare/:w_id/aadhar/:aadharNO/:b_name')
    .get(todoList.check_by_aadhar)
	
	app.get('/',function(req,res){
    res.render('index.html');
    });
     
    app.get('/Register', function (req, res) {
  sess = req.session;
  if (sess.aadhar_id) {
    
    db.executeSql('select aadhar,name,dob,address,state from user_info where aadhar=\'' + sess.aadhar_id + '\'', function (result,err) {
      console.log(result);
      if (err) throw err;
      res.render('user_profile.html', { v_id: result[0].aadhar, v_name: result[0].name, v_age: result[0].dob, v_state: result[0].state, v_address: result[0].address });
    });
  } else {
    res.render('register_aadhar.html');

  }
});	
	
    app.get('/action_page',function(req,res){
		var request = require('request');
     request({
    url: 'http://localhost:8081/AADHAR_API/'+req.query.aadharno,
    method: 'GET',
     }, function (error, response, body) {
    
    if (error) {
        console.log('Connection problem' +error );
    }
    
    if (response) {
        if (response.statusCode === 200) {
            var data=JSON.parse(response.body);
			console.log(data[0].name);
			res.render('register.html',{dat:JSON.stringify(data)});
			
        } else {
            if (response.statusCode === 400) {
                console.log('Invalid access token');
				console.log(JSON.parse(response.body)); 
            }
        }
    }
										}); 
    });

app.post('/login', urlencodedParser, function (req, res) {

  // if(err)throw err;
  console.log("CONNECTION ESTABLISHED\nyou can start your query now");
  
    db.executeSql('select aadhar,password from user_info where aadhar=\'' + req.body.aadhar_id + '\' AND password=\'' + req.body.password + '\'', function (result,err) {

    console.log(result);
    if (err) throw err;
    if (result.length != 0) {
      console.log("you are authorized to access");
      sess = req.session;
      sess.aadhar_id = req.body.aadhar_id;
      res.redirect('/user_profile');
    }
    else {
      console.log("you are not authorized to access");
      res.redirect('/user_profile');

    }
  });
});

app.get('/user_profile', function (req, res) {
  sess = req.session;
  if (sess.aadhar_id) {
    
    db.executeSql('select aadhar,name,dob,address,state from user_info where aadhar=\'' + sess.aadhar_id + '\'', function (result,err) {
      console.log(result);
      if (err) throw err;
      res.render('user_profile.html', { v_id: result[0].aadhar, v_name: result[0].name, v_age: result[0].dob, v_state: result[0].state, v_address: result[0].address });
    });
  } else {
    res.render('login.html');

  }
});


app.post('/user_register', urlencodedParser, function (req, res) {
	var sql='insert into user_info(aadhar,name,father_name,gender,dob,address,state,city,mobile,email,password)values(\'' + req.body.Aadharno + '\',\'' + req.body.Name + '\',\'' + req.body.fathername + '\',\'' + req.body.gender + '\',\'' + req.body.dob + '\',\'' + req.body.address + '\',\'' + req.body.state + '\',\'' + req.body.city + '\',\'' + req.body.mobile + '\',\'' + req.body.email + '\',\'' + req.body.pwd + '\')';
	
    db.executeSql(sql, function (result, err) {
      console.log(result);
      if (err) throw err;
      if (result.length != 0) {

        console.log("you are authorized to access");
        res.render('login.html');}
      
      else {
        console.log("you are not authorized to access");
        res.render('register.html');

      }
    });
  });
  
app.post('/User_admin', urlencodedParser, function (req, res) {
  
    
    db.executeSql('select password from admin where password=\''+req.body.password+'\'',function(result,err)
    {
      console.log(result);
      if(err)throw err;
    if(result.length!=0)
    {console.log("you are authorized to access");
		res.render('admin_fill.html');

    }
    else
    {
      console.log("you are not authorized to access");
	  res.render('lockscreen.html');

    }
  });

});
  
  app.get('/lockscreen', function (req, res) {
  sess = req.session;
  if (sess.aadhar_id) {
    //sess.roll_no=req.body.username;
    res.redirect('/User_admin');
  }
  else {
    res.render('lockscreen.html');
  }
});

app.post('/User_admin_fill', urlencodedParser, function (req, res) {


  console.log("CONNECTION ESTABLISHED\nyou can start your query now");
   console.log(req.body.no_of_schemes.length);
    
    db.executeSql('insert into welfare(w_id,w_name,type,max_reg) values(\'' + req.body.w_id + '\',\'' + req.body.w_name + '\',\'' + req.body.type + '\',\'' + req.body.max_reg + '\')', function (result,err) {
      console.log(result);
      if (err) throw err;
      if (result.length != 0) {var i;
       for(i=1;i<=req.body.no_of_schemes.length;i++)
           { 
               
               
    db.executeSql('insert into scheme_amt(w_id,category,amount,type) values(\''+req.body.w_id+'\',\''+req.body['scheme'+i]+'\',\''+req.body['amount'+i]+'\',\''+req.body.type+'\')',function(res,err){
                   if (err) throw err;
	var l=req.body.no_of_rules.length;
    console.log(req.body['answer'+l]);
	var cond="";
	for(i=1;i<=l;i++)
	{
		
       if(i!=l)
      {
      	cond += '{"'+req.body["operator"+i]+'"'+':[{"var" : "'+req.body["test"+i]+'"},'+req.body["answer"+i]+']}'+' , ';
      }

	   else
	   {
	   	cond += '{"'+req.body["operator"+i]+'"'+':[{"var" : "'+req.body["test"+i]+'"},'+req.body["answer"+i]+']}';
	   }
	}	  
   var json='{"and":['+cond+']}'
   fs.appendFile('./rules_data/'+req.body.w_name+'.json',json,function(err){
   console.log('done');
   });	
				   
               }); 
               
               
           }
        res.render('admin_fill.html');}

      
      else {
        console.log("you are not authorized to access");
        res.render('lockscreen.html');
      }
    });
  });

  app.post('/view_scheme', function (req, res) {
  console.log("CONNECTION ESTABLISHED\nyou can start your query now");
 sess = req.session;
  if (sess.aadhar_id)
  {
	db.executeSql('select * from user_info where aadhar = '+sess.aadhar_id,function(ress,err){	
	if (err) throw err;
  db.executeSql('select * from welfare ', function (result, err) {
      console.log(result); 
    if (err) throw err;
	var k=0;
	var j=0;
	var r=[];
	for(var i=0;i<result.length;i++)
	{
		var obj=result[i];
		console.log(result);
		var rules;
		var json_data;
		fs.readFile('./rules_data/'+result[i].w_name+'.json', 'utf8', function (err, data) {
		if (err) throw err;
		rules = JSON.parse(data);
		let ageFromString = new AgeFromDateString(ress[0].dob+'').age;
        console.log("value from ageFromString", ageFromString);
		ress.age=ageFromString;
		json_data={ress};
		var answer = jsonLogic.apply(rules, json_data);
		console.log(answer);
		if(answer==true)
		{
			console.log(obj);
			r[k]=obj;
			k++;
		}
		j++;
		console.log(result.length);	
		console.log(j);
		if (result.length == j) {
		console.log(r);
        res.render('test1.html', { data:r});
			}
	    });
		
		
	}
    
  });
	});
  }
});  
};
  console.log("CONNECTION ESTABLISHED\nyou can start your query now");
   