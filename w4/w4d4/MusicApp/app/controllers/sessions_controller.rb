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
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
    redirect_to users_url
  end
end
