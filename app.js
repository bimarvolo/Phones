// dfasf
// fdasf


myApp = angular.module('myApp', []);

myApp.controller("Controller1", function($scope, $http){
  $http.get('/phones/phones.json', {}).then(function (result){
    $scope.phones = result.data;
  });
    $scope.message = 'Chào mừng các bạn đến với freetuts.net';

});

myApp.controller("PhoneController",function($scope,$http){
  $scope.persion = {firstname: 'Join', lastname : 'Doe'}
});


/*var express = require('express');
var app = express();

app.get('/', function (req, res) {
  res.send('Hello World!');
});
app.use(express.static('phones'));
var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});
*/
