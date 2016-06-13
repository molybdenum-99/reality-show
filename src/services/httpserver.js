var Fetch = require('whatwg-fetch');
var baseUrl = '';

var service = {
  post: function(url){
    return fetch(baseUrl + url, {method: 'POST'}).then(function(response){
//      debugger;
      return response.json();
    });
  }
};

module.exports = service;
