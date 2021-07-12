var http = require("http");
var path = require("path");
var express = require("express");

// Creat the express app
var app = express();

app.set("views", path.resolve(__dirname, "views"));
app.set("view engine", "ejs");

app.get("/", function(req, res){
    res.render("index");
});

app.listen(3000, function(){
    console.log("App is running;");
});