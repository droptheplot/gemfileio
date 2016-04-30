class ProjectEachSerializer < ActiveModel::Serializer
  attributes(
    *%i[
      id
      name
      owner
      repo
      stars_count
      forks_count
      contributors_count
      downloads_count
      comments_count
      description
      github_name
      github_url
      url
    ]
  )

  def url
    project_path(self.id)
  end
end
