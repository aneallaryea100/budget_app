class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = current_user.name
  end
end
