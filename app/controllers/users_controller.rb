class UsersController < ApplicationController
  before_action :already_signed_in, only: [:new, :create]

  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(user_name: params[:user][:user_name],
                     password: params[:user][:password])

    if @user.save
      login_user!(@user)
      redirect_to cats_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])

    render :show
  end

end
