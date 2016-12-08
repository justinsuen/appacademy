class BandsController < ApplicationController
  before_action :require_user!
  
  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(name: params[:band][:name])

    if @band.save
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  def update
    @band = Band.find_by(id: params[:id])

    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band = Band.find_by(id: params[:id])

    if @band
      Band.destroy(params[:id])
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :show
    end
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end
end
