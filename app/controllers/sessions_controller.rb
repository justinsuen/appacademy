class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])

    if @user
      login_user!(@user)
      flash.now[:notice] = "You have logged in!"
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    logout!
    render :new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
