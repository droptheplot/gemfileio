class Adminable::ProjectsController < Adminable::ResourcesController
  set_attributes do |attributes|
    attributes.set(
      :description,
      :readme,
      :updated_at,
      index: false
    )

    attributes.set :category, index: true
  end
end
