class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email],
                                     params[:user][:password])

    if @user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ['Wrong username and/or password.']
      render :new
    end
  end

  def destroy
    logout_user! if logged_in?
    redirect_to new_session_url
  end
end
