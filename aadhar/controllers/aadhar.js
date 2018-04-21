var db=require("../core/db");
exports.detail_of_aadhar = function(req,resp){
	var sql="SELECT * FROM aadhar where aadharno = "+req.params.aadharNO;
	db.executeSql(sql,function(data,err){
		if (err){
			throw err;
		resp.end();
		}
		else{
			resp.writeHead(200,{"Content-Type":"application/json"});
			if(data.length>0)
			{
				resp.write(JSON.stringify(data));
			    resp.end();
			}
							
				
		}
	});
};
