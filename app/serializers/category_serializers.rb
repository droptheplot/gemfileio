class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :projects_count
end
