var ProjectsIndex = React.createClass({
  getInitialState: function() {
    return {
      projects: [],
      baseApiUrl: '/api/v1/projects'
    };
  },

  componentDidMount: function() {
    this.serverRequest = $.get(this.state.baseApiUrl, function(data) {
      this.setState({
        projects: data
      });
    }.bind(this));
  },

  componentWillUnmount: function() {
    this.serverRequest.abort();
  },

  render: function() {
    return (
      <div>
        {this.state.projects.map(function(project) {
          return <ProjectsItem {...project} key={project.id} />;
        })}
      </div>
    )
  }
});
