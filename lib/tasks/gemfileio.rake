namespace :gemfileio do
  task parse: :environment do
    Project.active.each do |project|
      Parser.new(project).async.parse
    end
  end

  task counters: :environment do
    Category.all.each do |category|
      category.update(projects_count: category.projects.active.count)
    end
  end
end
