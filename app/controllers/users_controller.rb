class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "プロフィールを作成しました"
      redirect_to  home_index_path
    else
      render edit_user_path
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:avatar, :name, :introduction).merge(id: current_user.id)
  end
end
