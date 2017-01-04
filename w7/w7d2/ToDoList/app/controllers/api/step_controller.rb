class Api::StepController < ApplicationController
  def index
    @steps = Todo.find(params[:todo_id]).steps
    render json: @steps
  end

  def create
    @step = Step.new(step_params)

    if @step.save
      render json: @step
    else
      render json: @step.errors.full_messages, status: 422
    end
  end

  def update
    @step = Step.find(params[:id])

    if @step
      @step.update_attributes(step_params)
      render json: @step
    else
      render json: { message: 'Step not found', status: 404 }
    end
  end

  def destroy
    @step = Step.find(params[:id]).destroy
    render json: @step
  end

  private

  def step_params
    params.require(:step).permit(:title, :todo_id, :done)
  end
end
