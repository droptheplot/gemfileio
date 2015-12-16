class Project < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  def ref
    [self.owner, self.repo].join('/') if self.owner && self.repo
  end

  def url
    URI.join('https://github.com', self.ref).to_s if self.ref
  end
end
