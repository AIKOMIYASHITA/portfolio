class UserCommentsController < ApplicationController
  def new
    @user = User.find_by(id: params[:user_id])
    @user_comment=UserComment.new
  end
  def create
    if @user = User.find_by(id: params[:user_id])
      if UserComment.create(sender_id: current_user.id,receiver_id: @user.id,body: params[:user_comment][:body])
        redirect_to users_path,success: "ユーザーにコメントしました"
      else
        redirect_to users_path,danger: "コメントに失敗しました。"
      end
    end
  end
end
