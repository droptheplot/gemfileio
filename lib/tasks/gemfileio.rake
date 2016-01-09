namespace :gemfileio do
  task parse: :environment do
    client = Octokit::Client.new(:access_token => Rails.application.secrets.github_token)

    Project.active.where('updated_at < ? OR created_at > ?', 1.week.ago, 1.day.ago).each do |project|
      begin
        repo = client.repo(project.ref)
        kem = Gems.info(project.name)

        next if kem === "This rubygem could not be found."

        readme = begin
          Base64.decode64(Octokit.contents(project.ref, path: 'README.md')[:content])
        rescue Octokit::NotFound, Octokit::TooManyRequests
          ''
        end

        project.stars_count = repo[:stargazers_count]
        project.forks_count = repo[:forks]
        project.description = repo[:description]
        project.downloads_count = kem['downloads']
        project.readme = readme

        project.touch

        project.save
      rescue Octokit::InvalidRepository
        next
      end
    end
  end

  task counters: :environment do
    Category.all.each do |category|
      category.update(projects_count: category.projects.active.count)
    end
  end

  task statistics: :environment do
    statistic = Statistic.where(created_at: (Date.today.beginning_of_day...Date.today.end_of_day)).first_or_initialize

    statistic.active_projects_count = Project.active.count
    statistic.inactive_projects_count = Project.inactive.count

    statistic.save
  end
end
