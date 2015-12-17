class Project < ActiveRecord::Base
  belongs_to :category, counter_cache: true

  validates_presence_of :name
  validates_uniqueness_of :name

  scope :active, ->{ where(active: true) }
  scope :top, ->{ order(stars_count: :desc, forks_count: :desc, downloads_count: :desc) }

  def ref
    [self.owner, self.repo].join('/') if self.owner && self.repo
  end

  def url
    URI.join('https://github.com', self.ref).to_s if self.ref
  end
end
