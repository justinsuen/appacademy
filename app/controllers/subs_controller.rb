class SubsController < ApplicationController
  before_action :require_moderator, only: [:edit, :update, :destroy]

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)

    if @sub.save
      flash.now[:notice] = "Successfully created a sub!"
      redirect_to root_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])

    if @sub
      render :show
    else
      redirect_to root_url
    end
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    @sub = Sub.find_by(id: params[:id])

    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = Sub.find_by(id: params[:id])

    if @sub
      flash[:notice] = "Sub deleted"
      @sub.destroy
    else
      flash[:notice] = "Sub does not exist"
    end

    redirect_to root_url
  end

  private

  def require_moderator
    @sub = Sub.find_by(id: params[:id])
    unless current_user.id == @sub.moderator_id
      flash.now[:errors] = "You must be the moderator"
      render :show
    end
  end


  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end

end
