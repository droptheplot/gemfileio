class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :projects_count

  has_many :subcategories
end
