class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
       redirect_to root_path, success: '登録が完了しました'
      else
       flash.now[:danger] = "登録に失敗しました"
       render :new
      end

      respond_to do |format|
      if @user.save
        UserMailer.welcome_mail(@user).deliver_now
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
   end
  end
end
