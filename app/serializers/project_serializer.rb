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
    active
    category_id
    commits_count
    activity
  ]

  has_many :comments

  def comments
   object.comments.joins(:user)
  end
end
