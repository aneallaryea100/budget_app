class HomeController < ApplicationController
  def index
    @users = current_user.name
  end
end
