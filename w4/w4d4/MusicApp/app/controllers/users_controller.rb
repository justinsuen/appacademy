class UsersController < ApplicationController
  def index
    if current_user.admin
      @users = User.all
      render :index
    else
      redirect_to root_url
    end
  end

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

  def destroy
    @user = User.find_by(id: params[:id])

    if current_user.admin && @user
      @user.admin ? flash[:notice] = "You can't kill an admin!" : @user.destroy
      redirect_to users_url
    else
      redirect_to root_url
    end
  end

  def make_admin
    @users = User.all
    @user = User.find_by(id: params[:user_id])

    if @user.admin
      flash[:notice] = "#{@user.email} is already an admin!"
    else
      @user.make_admin!
      flash[:notice] = "We made #{@user.email} an admin!"
    end

    redirect_to users_url
  end

  def activation
    @user = User.find_by_activation_token(params[:activation])
    @user.activate!
    login_user!(@user)
    flash[:notice] = "Successfully activated your account!"
    redirect_to user_url(@user)
  end
end
