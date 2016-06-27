var React = require('react');

var HTTP = require('../services/httpserver');

var SearchBox = require('./SearchBox.jsx');
var Loader = require('react-loader');
var Pusher = require('pusher-js');
var pako = require('pako');
var base64 = require('base-64')

var RealityApp = React.createClass({
  getInitialState: function(){
    return(
      {
        result: '',
        loaded: true
      }
    );
  },

  componentWillMount: function() {
    this.pusher = new Pusher(window.pusher_key);
    this.channel_name = 'user'+Math.random();
    this.channel = this.pusher.subscribe(this.channel_name);
  },

  componentDidMount: function(){
    this.channel.bind('response', function(response){
      var data = this.decodeResponse(response);
      this.setState({result: data.result, loaded: true});
    }, this);

    if(document.location.hash.length > 0) {
      var query = decodeURIComponent(document.location.hash.split('#')[1]);
      this.handleSearch(query);
      this.refs.searchBox.setInitialValue(query);
    }
  },

  decodeResponse: function(response) {
    var decoded = pako.inflate(base64.decode(response), { to: 'string' });
    return JSON.parse(decoded);
  },

  handleSearch: function(query) {
    this.setState({loaded: false});
    HTTP.post('/search', {query: query, channel: this.channel_name}).then(function(data){
      document.location.hash = encodeURIComponent(query);
    }.bind(this));
  },

  searchByExample: function(e) {
    var query = e.target.innerHTML;
    this.handleSearch(query);
    this.refs.searchBox.setInitialValue(query);
  },

  render: function() {
    return (
        <div className="row">
          <div className="col-sm-2"></div>
          <div className="components col-sm-8">
            <SearchBox onNewSearch={this.handleSearch} ref="searchBox"/>
           <div className="text-center">
             <Loader loaded={this.state.loaded} color="#fff" >
               <h3><div dangerouslySetInnerHTML={{__html: this.state.result}} /></h3>
             </Loader>
           </div>
           <div>
             <h3>Try examples:</h3>
             <h4>
               <a onClick={this.searchByExample}>
                 E('Toronto').coord.distance_to(E('New York'))
               </a>
             </h4>
             <h4>
               <a onClick={this.searchByExample}>
                 E('UK').capital.coord.weather
               </a>
             </h4>
             <h4>
               <a onClick={this.searchByExample}>
                 E('Japan').economy.inflation
               </a>
             </h4>
           </div>
          </div>
          <div className="col-sm-2">
          </div>
        </div>
    );
  }
});

module.exports = RealityApp;
