class Adminable::UsersController < Adminable::ResourcesController
  def fields
    [
      Adminable::Fields::Integer.new(:id, form: false),
			Adminable::Fields::String.new(:name),
			Adminable::Fields::String.new(:email),
			Adminable::Fields::String.new(:password_hash),
			Adminable::Fields::String.new(:provider),
			Adminable::Fields::String.new(:uid),
			Adminable::Fields::Datetime.new(:created_at),
			Adminable::Fields::Datetime.new(:updated_at),
			Adminable::Fields::Boolean.new(:admin),
			Adminable::Fields::HasMany.new(:favorites),
			Adminable::Fields::HasMany.new(:projects)
    ]
  end
end
