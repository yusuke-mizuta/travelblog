class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.page(params[:page]).reverse_order
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to user_path(current_user), notice: "ユーザー情報を更新しました。"
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
