class SessionsController < ApplicationController
  before_filter :require_current_user!, only: [:destroy]
  before_filter :require_no_current_user!, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])

    if @user
      login_user(@user)
      redirect_to user_url(@user)
    else
      flash[:errors] = ["Wrong username and/or password!"]
      render :new
    end
  end

  def destroy
    logout_user
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
