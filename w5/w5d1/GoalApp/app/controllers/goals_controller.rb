class GoalsController < ApplicationController
  before_filter :require_current_user!

  def index
    @goals = current_user.goals
    render :index
  end

  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id

    if @goal.save
      flash.now[:notices] = ["Goal saved!"]
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])

    if @goal.update_attributes(goal_params)
      flash.now[:notices] = ["Goal updated!"]
      redirect_to @goal
    else
      flash[:errors] = @goal.errors.full_messages
      render :edit
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    flash.now[:notices] = ["Goal deleted!"]
    redirect_to goals_url
  end

  private

  def goal_params
    params.require(:goals).permit(:name, :details, :privacy, :completed)
  end
end
