class ProjectSerializer < ActiveModel::Serializer
  attributes *%i[
    id
    name
    owner
    repo
    stars_count
    forks_count
    contributors_count
    views_count
    downloads_count
    comments_count
    description
    ref
    url
    readme
    active
    category_id
    favorited_by_current_user
  ]

  def favorited_by_current_user
    scope ? scope.projects.where(id: object.id).present? : false
  end
end
