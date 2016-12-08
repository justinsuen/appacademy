class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(email: params[:user][:email],
                     password: params[:user][:password])

    if @user.save
      redirect_to users_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(id: params[:id])
    render :show
  end
end
