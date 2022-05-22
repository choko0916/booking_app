class HomeController < ApplicationController
  def index
    @user = current_user
    @profile = Profile.find(@user.id)
  end
end
