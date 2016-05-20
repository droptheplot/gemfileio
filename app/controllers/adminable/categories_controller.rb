class Adminable::CategoriesController < Adminable::ResourcesController
  def fields
    [
      Adminable::Fields::Integer.new(:id, form: false),
			Adminable::Fields::String.new(:title),
      Adminable::Fields::String.new(:slug),
			Adminable::Fields::Integer.new(:projects_count),
			Adminable::Fields::HasMany.new(:projects)
    ]
  end
end
