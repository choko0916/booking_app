class HomeController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      binding.pry
      @profile = Profile.find(@user.id)
      binding.pry
    end
  end
end
