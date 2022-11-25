class HomeController < ApplicationController
  def index
    # redirect_to groups_path if user_signed_in?
    if user_signed_in?
      redirect_to groups_path
      @users = current_user.name
    end
  end
end
