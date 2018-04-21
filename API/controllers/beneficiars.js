var db=require("../core/db");
exports.check_by_aadhar = function(req,resp){
	var sq="SELECT type FROM welfare w where w.w_id = "+req.params.w_id;
	var sql="SELECT * FROM beneficiars where aadhar = "+req.params.aadharNO+" and type = ("+sq+")";
	db.executeSql(sql,function(data,err){
		if (err){
			throw err;
		resp.end();
		}
		else{
			resp.writeHead(200,{"Content-Type":"application/json"});
			if(data.length>0)
			{
				var standard_output={
					"status":"present"
				}
				resp.write(JSON.stringify(standard_output));
			    resp.end();
			}
			else
			{   var standard_output={
					"status":"absent"
				}
				var val="VALUES ('"+req.params.w_id+"',("+sq+"), 'first', '"+req.params.aadharNO+"', '"+req.params.b_name+"', CURRENT_TIMESTAMP);";
				var sql1="INSERT INTO beneficiars (`w_id`, `type`, `category`, `aadhar`, `b_name`, `timestamp`) "+val;
				db.executeSql(sql1,function(result,error){
					if (err)
			            throw err;
                    else
						console.log("data inserted");	
				});
				
				resp.write(JSON.stringify(standard_output));
			    resp.end();
			}				
				
		}
	});
};
