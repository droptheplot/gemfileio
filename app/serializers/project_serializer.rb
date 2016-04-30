class ProjectSerializer < ActiveModel::Serializer
  attributes(
    *%i[
      id
      name
      owner
      repo
      description
      stars_count
      forks_count
      contributors_count
      views_count
      downloads_count
      comments_count
      commits_count
      github_name
      github_url
      url
    ]
  )

  def url
    project_path(self.id)
  end
end
