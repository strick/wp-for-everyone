var http = require("http");

function requestHandler(req, res) {

    res.end("Welcome to WordPress for everyone");

}

var server = http.createServer(requestHandler);

server.listen(3000);