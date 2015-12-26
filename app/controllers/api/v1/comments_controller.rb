class Api::V1::CommentsController < Api::V1::ApplicationController
  before_filter :authenticate!, only: :create

  def index
    @comments = Comment.where(project_id: params[:project_id]).order(id: :asc)

    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

    def comment_params
      params.permit(:project_id, :body)
    end
end
