class Api::V1::CategoriesController < Api::V1::ApplicationController
  def index
    @categories = Category.order(title: :asc)

    render json: @categories
  end
end
