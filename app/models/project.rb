class Project < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :favorites
  has_many :users, :through => :favorites

  validates_presence_of :name
  validates_uniqueness_of :name

  scope :active, ->{ where(active: true) }
  scope :top, ->{ order(stars_count: :desc, forks_count: :desc, downloads_count: :desc) }

  after_save :increment_category_counter_cache, if: -> (project) { project.active? && project.active_changed? }
  after_update :decrement_category_counter_cache, unless: :active?, if: :active_changed?
  after_destroy :decrement_category_counter_cache, if: :active?

  def ref
    [self.owner, self.repo].join('/') if self.owner && self.repo
  end

  def url
    URI.join('https://github.com', self.ref).to_s if self.ref
  end

  private

    def increment_category_counter_cache
      Category.increment_counter('projects_count', self.category.id)
    end

    def decrement_category_counter_cache
      Category.decrement_counter('projects_count', self.category.id)
    end
end
