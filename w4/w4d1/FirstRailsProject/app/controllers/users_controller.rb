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
        json: @user.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  def show
    @user = User.find_by_id(params[:id])

    if @user
      render json: @user
    else
      render text: "No user with ID #{params[:id]}"
    end
  end

  def update
    @user = User.find_by_id(params[:id])

    if !@user
      render text: "No user with ID #{params[:id]}"
    elsif @user.update(user_params)
      render json: @user
    else
      render(
        json: @user.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])

    if @user
      @user.destroy
      render json: @user
    else
      render text: "No user with ID #{params[:id]}"
    end
  end

  private
  def user_params
    params[:user].permit(:username)
  end
end
