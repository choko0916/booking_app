class ProfilesController < ApplicationController
  def index
  end

  def new
  end

  def show
    @user = current_user
    @profile = Profile.find(params[:id])
  end

  def create
  end

  def edit
    @user = current_user
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:notice] = "プロフィールを作成しました"
      redirect_to  edit_profile_path
    else
      render edit_profile_path
    end
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :image, :introduction).merge(user_id: current_user.id)
  end
end
