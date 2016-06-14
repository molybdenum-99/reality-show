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
    this.pusher = new Pusher('7b59d48fb0c2aff9dfb7');
    this.channel = this.pusher.subscribe('query');
  },

  componentDidMount: function(){
    this.channel.bind('response', function(response){
      var data = this.decodeResponse(response);
      this.setState({result: data.result, loaded: true});
    }, this);

    if(document.location.hash.length > 0) {
      query = decodeURIComponent(document.location.hash.split('#')[1]);
      this.handleSearch(query);
      this.refs.searchBox.setInitialValue(query);
    }
  },

  decodeResponse: function(response) {
    var decoded = pako.inflate(base64.decode(response), { to: 'string' });
    return JSON.parse(decoded);
  },

  handleSearch: function(search) {
    this.setState({loaded: false});
    HTTP.post('/query?query='+search).then(function(data){
      document.location.hash = encodeURIComponent(search);
    }.bind(this));
  },

  render: function() {
    return (
        <div className="row">
          <div className="col-sm-2"></div>
          <div className="components col-sm-8">
            <SearchBox onNewSearch={this.handleSearch} ref="searchBox"/>
           <div className="text-center">
             <Loader loaded={this.state.loaded} color="#fff" top="180%">
               <h3><div dangerouslySetInnerHTML={{__html: this.state.result}} /></h3>
             </Loader>
           </div>
          </div>
          <div className="col-sm-2">
          </div>
        </div>
    );
  }
});

module.exports = RealityApp;