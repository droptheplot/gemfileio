class CommentsController < ApplicationController
  before_filter :authenticate!, only: :create

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    @comment.save
    redirect_to @comment.project
  end

  private

    def comment_params
      params.require(:comment).permit(:project_id, :body)
    end
end
