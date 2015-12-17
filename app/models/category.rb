class Category < ActiveRecord::Base
  has_many :projects

  validates_presence_of :title
  validates_uniqueness_of :title
end
