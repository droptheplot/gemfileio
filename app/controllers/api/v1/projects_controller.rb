class Api::V1::ProjectsController < Api::V1::ApplicationController
  before_filter :set_project, only: :show

  def index
    @projects = Project.top
                       .active
                       .by_category(params[:category_id])
                       .by_query(params[:query])
                       .page(params[:page])
                       .per(30)

    headers['Link'] = (!@projects.last_page?).to_s

    render json: @projects, each_serializer: ProjectSerializer
  end

  def show
    render json: @project
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end
end
