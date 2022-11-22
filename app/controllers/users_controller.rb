class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  # only allow a list of users to be trusted through.
  def user_params
    params.require(:user).permit(:name)
  end
end
