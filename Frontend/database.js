
const express = require("express");
const path = require("path");
const app = express();
const ejs = require("ejs");
const {parse} = require("querystring");

const mysql = require("mysql");
const exp = require("constants");
const { copyFileSync } = require("fs");

//parse
app.use(express.json());
app.use(express.urlencoded({extended:true}));

//setting ejs
app.set("view engine","ejs");


var connection = mysql.createConnection({
    host : "localhost",
    user : "root",
    password : "9945",
    database : "grocery"
});

connection.connect(function(error){
    if (error)
    {
        console.log("error");
    }
    else{
        console.log("connected");
    }
});



app.get('/',function(req,res){

    res.sendFile(path.join(__dirname,"getData.html"));
    
});

app.post("/fetch",function(req,res){
    var strAmount = req.body.amount;

    var amount = parseInt(strAmount);
    var sql = `select cust_id,fname,lname,sum(amount) as total_bill 
    from payment join customer using (cust_id) 
    where exists (select * from payment where payment.cust_id = customer.cust_id
    group by cust_id having sum(amount) >= ${amount})
    group by cust_id;`
    connection.query(sql,function(err,rows,fields){
        if (err)
        {
            console.log(err);
        }
        else{
            
            let a = [...rows];
          
            if (a.length > 0)
            {
                res.render("final",{obj : a});
            }
            else
            {
                
                res.render("final",{obj : a});
            }
            
        }
    });

});


app.listen(8080);