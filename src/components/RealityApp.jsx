var React = require('react');

var HTTP = require('../services/httpserver');

var SearchBox = require('./SearchBox.jsx');

var RealityApp = React.createClass({
  getInitialState: function(){
    return(
      {
        result: ''
      }
    );
  },

  componentDidMount: function(){
    if(document.location.hash.length > 0) {
      query = document.location.hash.split('#')[1];
      this.handleSearch(query);
      this.refs.searchBox.setInitialValue(query);
    }
  },
  handleSearch: function(search){
    HTTP.get('/query?query='+search).then(function(data){
      document.location.hash = search;
      this.setState({result: data.result});
    }.bind(this));
  },

  render: function() {
    return (
      <div className="row">
        <div className="components col-sm-6">
          <SearchBox onNewSearch={this.handleSearch} ref="searchBox"/>
          <h2>{this.state.result}</h2>
        </div>
      </div>
    );
  }
});

module.exports = RealityApp;
