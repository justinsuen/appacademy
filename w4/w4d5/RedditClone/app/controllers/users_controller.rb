class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Successfully signed up!"
      render :new
      # redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = "Successfully updated user!"
      render :edit
      # redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def show
    @user = User.find_by(id: params[:id])

    if @user
      render :show
    else
      flash[:errors] = "User does not exist!"
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :session_token)
  end
end
