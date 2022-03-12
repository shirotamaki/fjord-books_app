# frozen_string_literal: true

class Reports::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_commentable

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    @comment.save
    redirect_to @commentable, notice: 'Your comment was successfully posted.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end
end
