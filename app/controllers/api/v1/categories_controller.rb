class Api::V1::CategoriesController < Api::V1::ApplicationController
  def index
    @categories = Category.all

    render json: @categories
  end
end
