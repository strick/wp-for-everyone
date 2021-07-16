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

        var exec =  require('child_process').exec;

        console.log(path.resolve(__dirname, "scripts"));

        var cmd = `pwd
        cd ${path.resolve(__dirname, "scripts")}
        /azure-cli/bin/python -m azure.cli webapp create --resource-group hackday-summer-2021 --plan hackdaysummer2021 --name ${req.body.sitename} --multicontainer-config-type compose --multicontainer-config-file docker-compose.yml
        `;

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

app.listen(process.env.PORT || 80, function(){
    console.log("App is running;");
});