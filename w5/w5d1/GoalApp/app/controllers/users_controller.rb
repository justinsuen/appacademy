class UsersController < ApplicationController
  before_filter :require_no_current_user!, only: [:new, :create]

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by_id(params[:id])

    if @user
      render :show
    else
      flash[:errors] = "User does not exist"
      index
    end
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(username: user_params[:username], password: user_params[:password])

    if @user.save
      render :show
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
