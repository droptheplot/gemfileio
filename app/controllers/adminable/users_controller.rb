class Adminable::UsersController < Adminable::ResourcesController
  set_attributes do |attributes|
    attributes.set(
      :password_hash,
      :provider,
      :uid,
      :updated_at,
      index: false
    )
  end
end
