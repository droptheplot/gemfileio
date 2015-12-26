class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :project, counter_cache: true

  validates_presence_of :body
end
