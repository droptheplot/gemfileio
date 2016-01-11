class Category < ActiveRecord::Base
  has_many :projects
  has_many :subcategories, class_name: 'Category', foreign_key: 'category_id'
  belongs_to :supercategory, class_name: 'Category', foreign_key: 'category_id'

  validates_presence_of :title
  validates_uniqueness_of :title
end
