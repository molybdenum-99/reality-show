var Fetch = require('whatwg-fetch');
var baseUrl = '';

var service = {
  post: function(url, data){
    return fetch(baseUrl + url, {method: 'POST', body: JSON.stringify(data)}).then(function(response){
      return response.json();
    });
  }
};

module.exports = service;
