class Project < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  def ref
    [self.owner, self.repo].join('/') if self.owner && self.repo
  end
end
