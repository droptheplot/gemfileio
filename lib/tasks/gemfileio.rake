namespace :gemfileio do
  task parse: :environment do
    client = Octokit::Client.new(:access_token => Rails.application.secrets.github_token)

    Project.active.each do |project|
      repo = client.repo(project.ref)
      kem = Gems.info(project.name)

      readme = begin
        Base64.decode64(Octokit.contents(project.ref, path: 'README.md')[:content])
      rescue Octokit::NotFound
        ''
      end

      project.stars_count = repo[:stargazers_count]
      project.forks_count = repo[:forks]
      project.description = repo[:description]
      project.downloads_count = kem['downloads']
      project.readme = readme

      project.touch

      project.save
    end
  end

  task counters: :environment do
    Category.all.each do |category|
      category.update(projects_count: category.projects.active.count)
    end
  end
end
