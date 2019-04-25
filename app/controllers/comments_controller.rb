class CommentsController < ApplicationController
  def index
    @comment_topics = current_user.comment_topics
  end

  def new
    @comment = Comment.new
    @topic_id = params[:topic_id]
  end

  def create
    #binding.pry
    comment = Comment.new
    comment.user_id = current_user.id
    comment.topic_id = params[:topic_id]
    comment.comment = params[:comment][:comment]
    if comment.save
      redirect_to topics_path, success: 'コメントに成功しました'
    else
      redirect_to topics_path, danger: 'コメントに失敗しました'
    end
  end
end
