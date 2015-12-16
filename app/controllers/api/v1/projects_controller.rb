class Api::V1::ProjectsController < Api::V1::ApplicationController
  def index
    @projects = Project.all

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
