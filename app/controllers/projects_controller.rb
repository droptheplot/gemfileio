class ProjectsController < ApplicationController
  before_filter :set_project, only: :show
  before_filter :set_category, only: :index

  def index
    @meta_tags = {
      description: 'Ruby gems catalog.',
      keywords: 'ruby, gem, gems, rubygems, rails, github'
    }
  end

  def show
    @comment = Comment.new
    @chart = Chart.new(@project.commits_count)

    @title = "%s ruby gem" % [@project.name]
    @meta_tags = {
      description: @project.description,
      keywords: "%s, ruby, gem" % [@project.name]
    }
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
      @project = Project.find_by(name: params[:name])
    end

    def set_category
      @category = if params[:category_id]
                    Category.find(params[:category_id])
                  else
                    NilCategory.new
                  end
    end

    def project_params
      params.require(:project).permit(
        :name, :owner, :repo, :active, :category_id, :github_url
      )
    end
end
