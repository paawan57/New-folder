var mysql = require("mysql");
var settings = require("../setting");
exports.executeSql=function(sql,callback){
	var conn=mysql.createConnection(settings.dbConfig);
	
		
		conn.query(sql,function(err,recordset){
			if(err)
			{
				console.log(err);
		      callback(null,err);
			}else
			callback(recordset);
		});
			

	    
};