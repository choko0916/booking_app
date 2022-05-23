class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    binding.pry
  end

  def update
    @user = User.find(params[:id])
    binding.pry
    if @user.update(user_params)
      binding.pry
      flash[:notice] = "プロフィールを作成しました"
      redirect_to  edit_user_path
    else
      binding.pry
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
