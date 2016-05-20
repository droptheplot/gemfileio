class Adminable::ProjectsController < Adminable::ResourcesController
  def fields
    [
      Adminable::Fields::Integer.new(:id, form: false),
			Adminable::Fields::String.new(:name),
			Adminable::Fields::String.new(:owner),
			Adminable::Fields::String.new(:repo),
			Adminable::Fields::Text.new(:description, index: false),
			Adminable::Fields::Integer.new(:stars_count),
			Adminable::Fields::Integer.new(:forks_count),
			Adminable::Fields::Integer.new(:contributors_count),
			Adminable::Fields::Integer.new(:views_count),
			Adminable::Fields::Integer.new(:downloads_count),
			Adminable::Fields::Boolean.new(:active),
			Adminable::Fields::Text.new(:readme, index: false),
			Adminable::Fields::Integer.new(:comments_count),
			Adminable::Fields::String.new(:slug),
			Adminable::Fields::BelongsTo.new(:category),
			Adminable::Fields::HasMany.new(:comments),
      Adminable::Fields::Datetime.new(:created_at),
    ]
  end

  def set_entry
    entry = @resource.model.find_by(name: params[:id])

    super
  end
end
