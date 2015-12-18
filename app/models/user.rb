class User < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :provider, scope: :uid, :case_sensitive => false

  def token
    JWT.encode(
      {
        user: {
          id: self.id,
          name: self.name,
        },
        exp: (DateTime.now + 30).to_i
      },
      Rails.application.secrets.jwt_secret,
      'HS512'
    )
  end
end
