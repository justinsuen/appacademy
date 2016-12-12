class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])

    if @user
      login_user(@user)
      flash.now[:notice] = "Successfully login user!"
      redirect_to links_url
    else
      flash[:errors] = "Wrong username and/or password!"
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
