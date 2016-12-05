class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render(
        json: @user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def new
    render text: "I'm in the new action!"
  end

  def edit
    render text: "I'm in the edit action!"
  end

  def show
    render text: "I'm in the show action!"
  end

  def update
    render text: "I'm in the update action!"
  end

  def destroy
    render text: "I'm in the destroy action!"
  end

  private
  def user_params
    params[:user].permit(:name, :email)
  end
end
