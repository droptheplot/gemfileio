class StatisticSerializer < ActiveModel::Serializer
  attributes :id, :active_projects_count, :inactive_projects_count, :created_at
end
