class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])

    if @cat
      render :show
    else
      redirect_to cats_url
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render :new
    end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  private
  def cat_params
    params.require(:cat).permit(:name, :color, :sex, :description, :birth_date)
  end
end
