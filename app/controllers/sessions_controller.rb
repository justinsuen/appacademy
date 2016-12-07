class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params)

    if @user
      session[:session_token] = @user.reset_session_token!
      redirect_to cats_url
    else
      flash[:errors] = ["Wrong username and/or password!"]
      render :new
    end
  end

  def destroy

  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
