class Statistic < ActiveRecord::Base
  validates_presence_of :active_projects_count, :inactive_projects_count
end
