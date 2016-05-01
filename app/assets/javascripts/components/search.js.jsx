var Search = React.createClass({
  getInitialState: function() {
    return {
      query: ''
    };
  },

  submitSearch: function(event) {
    var query = event.target.value;

    this.setState({
      query: query
    });

    PubSub.publish('searchUpdated', query);
  },

  render: function() {
    return (
      <div className='search'>
        <button type='submit'>
          <i className='fa fa-search'></i>
        </button>
        <input type='text' value={this.state.query} onChange={this.submitSearch} placeholder='Search' />
      </div>
    );
  }
});
