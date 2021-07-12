var http = require("http");
var path = require("path");
var express = require("express");
var { exec } = require('child_process');
var dotenv = require('dotenv');

dotenv.config();

// Creat the express app
var app = express();

app.set("views", path.resolve(__dirname, "views"));
app.set("view engine", "ejs");

app.use(express.urlencoded({
    extended: true
  }))

app.get("/", function(req, res){
    res.render("index");
});

app.post("/create", function(req, res){

    console.log(req.body.sitename);
    if(req.body.sitename == null){
        res.render("error");
    }

    else {
        var cmd = `cd scripts  
        az deployment group create --resource-group hackday-summer-2021 --parameters webAppName="${req.body.sitename}" --template-file webapp.json 
        `;
        var exec =  require('child_process').exec;

        exec(cmd, function(err, stdout, stderr) {

            if(stderr){
                res.end(stderr);
            }
            console.log(stdout);
            res.render("create", {
                sitename: req.body.sitename
            });
        });

       
    }
});

app.listen(3000, function(){
    console.log("App is running;");
});