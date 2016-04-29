class Adminable::CategoriesController < Adminable::ResourcesController
  set_attributes do |attributes|
    attributes.set(
      :created_at,
      :updated_at,
      index: false
    )
  end
end
