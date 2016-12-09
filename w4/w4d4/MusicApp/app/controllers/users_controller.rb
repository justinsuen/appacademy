class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(email: params[:user][:email],
                     password: params[:user][:password])

    if @user.save
      UserMailer.activation_email(@user).deliver!
      flash[:notice] =
        "Successfully created your account! Check your inbox for an activation email."
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def activation
    @user = User.find_by_activation_token(params[:activation])
    @user.activate!
    login_user!(@user)
    flash[:notice] = "Successfully activated your account!"
    redirect_to user_url(@user)
  end
end
