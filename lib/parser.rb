class Parser
  include Celluloid

  def initialize(project)
    @project = project
  end

  def parse
    raise if gem_info === "This rubygem could not be found."

    repo = octokit_client.repo(project.github_name)

    commits_count = octokit_client.participation_stats(project.github_name)

    project.stars_count = repo[:stargazers_count]
    project.forks_count = repo[:forks]
    project.description = repo[:description]
    project.commits_count = commits_count[:all].last(90) if commits_count
    project.downloads_count = gem_info['downloads']

    project.save

    ActiveRecord::Base.connection.close

  rescue Octokit::InvalidRepository
    project.update(active: false)
  end

  private

    attr_accessor :project

    def octokit_client
      @octokit_client ||= Octokit::Client.new(
        access_token: Rails.application.secrets.github_token
      )
    end

    def gem_info
      @gem_info ||= Gems.info(project.name)
    end
end
