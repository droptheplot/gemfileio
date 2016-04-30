var ProjectsItem = React.createClass({
  render: function() {
    return (
      <div className='project'>
        <div className='title'>
          <a href={this.props.url}>{this.props.name}</a>
        </div>
        <div className='description'>{this.props.description}</div>
        <div className='info'>
          <div className='row'>
            <span>
              <i className='fa fa-star-o'></i>
              {this.props.stars_count}
            </span>
            <span>
              <i className='fa fa-code-fork'></i>
              {this.props.forks_count}
            </span>
            <span>
              <i className='fa fa-download'></i>
              {this.props.downloads_count}
            </span>
            <span>
              <i className='fa fa-comment-o'></i>
              {this.props.comments_count}
            </span>
            <span>
              <i className='fa fa-github'></i>
              <a href={this.props.github_url} target='_blank'>
                {this.props.github_name}
              </a>
            </span>
          </div>
        </div>
      </div>
    );
  }
});
