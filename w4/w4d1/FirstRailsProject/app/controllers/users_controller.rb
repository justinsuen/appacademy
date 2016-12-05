class UsersController < ApplicationController
  def index
    render text: "I'm in the index action!"
  end

  def create
    render text: "I'm in the create action!"
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
end
