class Api::V1::ProjectsController < Api::V1::ApplicationController
  before_filter :set_project, only: [:show, :update]
  before_filter :authenticate_admin!, only: :update

  def index
    @projects = Project.top.page(params[:page]).per(30)

    @projects = @projects.active if params[:active]
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
      render json: @project.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.permit(:name, :owner, :repo, :active, :category_id)
    end
end
