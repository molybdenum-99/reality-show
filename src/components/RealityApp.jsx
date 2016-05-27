var React = require('react');

var HTTP = require('../services/httpserver');

var SearchBox = require('./SearchBox.jsx');
var Loader = require('react-loader');

var RealityApp = React.createClass({
  getInitialState: function(){
    return(
      {
        result: '',
        loaded: true
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
    this.setState({loaded: false});
    HTTP.get('/query?query='+search).then(function(data){
      document.location.hash = search;
      this.setState({result: data.result, loaded: true});
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
