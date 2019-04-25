class UsersController < ApplicationController
  def index
    @users = User.all
  end

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
  end
  def show
    @user=User.find_by(id: params[:id])
  end

  def edit
    @user=User.find_by(id: params[:id])
  end
  def update
    if current_user && current_user.authenticate(user_params[:password])
      current_user.update_attributes(user_params)
      redirect_to user_path(current_user)
    else
      @user = current_user
      render :edit
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if current_user == @user
      current_user.delete
      redirect_to root_path,success: "退会しました"
    else
      redirect_to user_path(current_user),danger: "退会に失敗しました"
    end
  end
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @users = User.search(params[:search])
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
