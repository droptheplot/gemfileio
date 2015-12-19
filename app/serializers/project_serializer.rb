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
    description
    ref
    url
    readme
  ]
end
