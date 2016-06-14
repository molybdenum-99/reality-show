var React = require('react');

var searchBorder = {
  borderRadius: 50,
  border: "2px solid #2EAD5B",
  padding: 10,
  paddingLeft: 20
};
var searchIconBorder = {
  backgroundColor: "#45CA75",
  borderRadius: 50,
  border: "2px solid #2EAD5B",
  width: 46,
  height: 46,
  cursor: "pointer"
}
var inputStyle = {
  backgroundColor: "#333333",
  border: "none",
  width: "100%"
};
var searchIcon = {
  fontSize: 14
}
var marginBottom = {
  paddingTop: 10,
  paddingBottom: 10
}

var SearchBox = React.createClass({
  setInitialValue: function(value) {
    this.refs.searchInput.value = value;
  },

  handleSubmit: function(e){
    e.preventDefault();
    if (this.refs.searchInput.value.trim() && this.props.onNewSearch) {
      this.props.onNewSearch(this.refs.searchInput.value);
    }
  },

  render: function() {
    return (
      <div className="row" style={marginBottom}>
        <div className="col-xs-12">
          <div className="row">
            <form onSubmit={this.handleSubmit} >
              <div className="col-xs-1"></div>
              <div className="col-xs-10">
                <div style={searchBorder}>
                  <input style={inputStyle} ref="searchInput" placeholder="e.g. Entity('Ukraine').capital.coord.weather.sky"/>
                </div>
              </div>
              <div className="col-xs-1">
                <button style={searchIconBorder} type="btn">
                  <i className="fa fa-search" style={searchIcon}></i>
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    );
  }
});

module.exports = SearchBox;
