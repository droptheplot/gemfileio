var ProjectsIndex = React.createClass({
  getInitialState: function() {
    var apiUrl = '/api/v1/projects';

    return {
      projects: [],
      baseApiUrl: apiUrl,
      currentApiUrl: apiUrl,
      page: 1,
      lastPage: false,
      query: ''
    };
  },

  loadProjects: function() {
    var params = $.param({
      page: this.state.page,
      query: this.state.query,
      category_id: this.props.category_id
    });

    var newCurrentApiUrl = this.state.baseApiUrl + '?' + params;

    this.projectsRequest = $.get(newCurrentApiUrl, function(data, status, request) {
      this.setState({
        projects: this.state.projects.concat(data),
        currentApiUrl: newCurrentApiUrl,
        page: this.state.page + 1,
        lastPage: (request.getResponseHeader('Last-Page') === 'true')
      });
    }.bind(this));
  },

  searchSubscriber: function(mas, query) {
    this.setState({
      projects: [],
      page: 1,
      query: query
    });

    this.loadProjects();
  },

  componentDidMount: function() {
    PubSub.subscribe('searchUpdated', this.searchSubscriber);

    this.loadProjects();
  },

  componentWillUnmount: function() {
    this.projectsRequest.abort();
  },

  render: function() {
    return (
      <div>
        {this.state.projects.map(function(project) {
          return <ProjectsItem {...project} key={project.id} />;
        })}
        {this.state.lastPage ?
          <div className='pagination'>
            <div className='btn clear' onClick={this.loadProjects}>More Projects</div>
          </div>
        : null}
      </div>
    )
  }
});
