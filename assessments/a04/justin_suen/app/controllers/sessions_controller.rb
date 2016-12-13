class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(session_params[:username], session_params[:password])

    if @user
      login_user(@user)
      redirect_to tweets_url
    else
      flash[:errors] = ["Wrong username and/or password"]
      render :new
    end
  end

  def destroy
    logout_user
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
