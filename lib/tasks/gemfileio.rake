namespace :gemfileio do
  task parse: :environment do
    client = Octokit::Client.new(:access_token => Rails.application.secrets.github_token)

    Project.active.each do |project|
      repo = client.repo(project.ref)
      kem = Gems.info(project.name)

      project.stars_count = repo[:stargazers_count]
      project.forks_count = repo[:forks]
      project.description = repo[:description]
      project.downloads_count = kem['downloads']

      project.touch

      project.save
    end
  end
end
