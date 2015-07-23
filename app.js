//Lets require/import the HTTP module
var http = require('http');
var args = {};

process.argv.filter(function (argument) {
    return argument.indexOf('=') !== -1;
}).forEach(function (argument) {
    var arg = argument.split('--')[1].split('=');
    args[arg[0]] = arg[1];
});

//We need a function which handles requests and send response
function handleRequest(request, response) {
    response.end('It Works!! Path Hit: ' + request.url + ':' + args.port);
}

//Create a server
var server = http.createServer(handleRequest);

//Lets start our server
server.listen(args.port, function() {
    //Callback triggered when server is successfully listening. Hurray!
    console.log("Server listening on: http://localhost:%s", args.port);
});