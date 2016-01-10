class Project < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  has_many :favorites
  has_many :users, :through => :favorites

  validates_presence_of :name
  validates_uniqueness_of :name
  validate :github_url_correctness

  scope :active, ->{ where(active: true) }
  scope :inactive, ->{ where(active: false) }
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

  def url=(url)
    matches = url.scan(/github.com\/([\w\-]+)\/([\w\-]+)/).first

    if matches
      self.owner, self.repo = matches.first, matches.second
    end
  end

  def activity
    self.commits_count.last(4).sum != 0
  end

  private

    def increment_category_counter_cache
      Category.increment_counter('projects_count', self.category.id)
    end

    def decrement_category_counter_cache
      Category.decrement_counter('projects_count', self.category.id)
    end

    def github_url_correctness
      if self.owner.nil? || self.repo.nil?
        self.errors.clear
        self.errors.add(:base, 'URL is invalid')
      end
    end
end
