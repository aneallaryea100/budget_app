class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to groups_path
      @users = current_user.name
    else
      @users = 'Guest'
    end
  end
end
