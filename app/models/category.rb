class Category < ActiveRecord::Base
  has_many :projects
  has_many :subcategories, class_name: 'Category', foreign_key: 'category_id'
  belongs_to :supercategory, class_name: 'Category', foreign_key: 'category_id'

  validates_presence_of :title
  validates_uniqueness_of :title

  before_save :generate_slug

  def to_param
    slug
  end

  private

    def generate_slug
      self.slug = self.title.to_slug.normalize.to_s
    end
end
