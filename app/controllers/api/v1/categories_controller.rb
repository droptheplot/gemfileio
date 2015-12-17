class Api::V1::CategoriesController < Api::V1::ApplicationController
  before_filter :set_category, only: :show

  def index
    @categories = Category.order(title: :asc)

    render json: @categories
  end

  def show
    render json: @category
  end

  private

    def set_category
      @category = Category.find(params[:id])
    end
end
