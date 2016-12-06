class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by_id(cat_params[:id])

    if @cat
      render :show
    else
      redirect_to cats_url
    end
  end

  private
  def cat_params
    params.permit(:id, :name)
  end
end
