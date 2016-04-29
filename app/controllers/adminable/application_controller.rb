class Adminable::ApplicationController < ApplicationController
  before_filter do
    unless current_user && current_user.admin?
      redirect_to Rails.application.routes.url_helpers.root_path
    end
  end
end
