class HomeController < ApplicationController
  def index
    if  user_signed_in? 
      @user = current_user
      @profile = Profile.find(@user.id)
    end
  end
end
