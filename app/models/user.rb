class User < ActiveRecord::Base
  has_many :favorites
  has_many :projects, through: :favorites

  validates_presence_of :name
  validates_uniqueness_of :provider, scope: :uid, case_sensitive: false
end
