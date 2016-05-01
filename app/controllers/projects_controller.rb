class ProjectsController < ApplicationController
  before_filter :set_project, only: :show
  before_filter :set_category, only: :index

  def index
    @projects = Project.top
                       .active
                       .by_category(params[:category_id])
                       .by_query(params[:query])
                       .page(params[:page])
                       .per(30)
  end

  def show
    @comment = Comment.new
    @chart = Chart.new(@project.commits_count)
  end

  def submit
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to root_path
    else
      render :submit
    end
  end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def set_category
      @category = if params[:category_id]
                    Category.find(params[:category_id])
                  else
                    NilCategory.new
                  end
    end

    def project_params
      params.require(:project).permit(:name, :owner, :repo, :active, :category_id, :url)
    end
end
