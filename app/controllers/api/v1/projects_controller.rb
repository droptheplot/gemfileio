class Api::V1::ProjectsController < Api::V1::ApplicationController
  def index
    @projects = Project.all.order(stars_count: :desc, forks_count: :desc).page(params[:page]).per(30)

    @projects = @projects.where(category_id: params[:category_id]) if params[:category_id]
    @projects = @projects.where('name LIKE ?', "%#{ params[:query] }%") if params[:query]

    render json: @projects
  end

  def show
    render json: @project
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end
end
