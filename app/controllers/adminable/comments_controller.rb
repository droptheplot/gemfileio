class Adminable::CommentsController < Adminable::ResourcesController
  set_attributes do |attributes|
    attributes.set :updated_at, index: false
    attributes.set :project, index: true
    attributes.set :user, index: true
  end
end
