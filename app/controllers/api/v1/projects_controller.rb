class Api::V1::ProjectsController < Api::V1::ApplicationController
  before_filter :set_project, only: [:show, :readme, :update, :toggle_favorite]
  before_filter :authenticate!, only: :toggle_favorite
  before_filter :authenticate_admin!, only: :update

  def index
    @projects = Project.top.page(params[:page]).per(30)

    if params[:active] && params[:active] === 'true'
      @projects = @projects.active
    else
      @projects = @projects.inactive
    end

    @projects = @projects.where(category_id: params[:category_id]) if params[:category_id]
    @projects = @projects.where('name LIKE ?', "%#{ params[:query] }%") if params[:query]
    @projects = @projects.joins(:users).where(favorites: { user_id: params[:favorited_by] }) if params[:favorited_by]

    headers['Link'] = (!@projects.last_page?).to_s

    render json: @projects, each_serializer: ProjectEachSerializer
  end

  def show
    render json: @project
  end

  def readme
    render json: @project, serializer: ProjectReadmeSerializer
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

  def toggle_favorite
    if @project.users.where(id: current_user.id).present?
      @project.users.delete(current_user)
    else
      @project.users << current_user
    end

    render json: @project
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.permit(:name, :owner, :repo, :active, :category_id, :url)
    end
end
