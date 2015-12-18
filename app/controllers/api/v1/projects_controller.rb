class Api::V1::ProjectsController < Api::V1::ApplicationController
  def index
    @projects = Project.active.top.page(params[:page]).per(30)

    @projects = @projects.where(category_id: params[:category_id]) if params[:category_id]
    @projects = @projects.where('name LIKE ?', "%#{ params[:query] }%") if params[:query]

    render json: @projects
  end

  def show
    render json: @project
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.permit(:name, :category_id)
    end
end
