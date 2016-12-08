class AlbumsController < ApplicationController
  before_action :require_user!

  def new
    @album = Album.new
    @band = Band.find_by(id: params[:band_id])
    render :new
  end

  def create
    @band = Band.find_by(id: params[:album][:band_id])
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by(id: params[:id])
    @band = Band.find_by(id: @album.band_id)
    render :edit
  end

  def update
    @album = Album.find_by(id: params[:id])
    @band = Band.find_by(id: @album.band_id)

    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @band = Band.find_by(id: @album.band_id)

    if @album
      Album.destroy(params[:id])
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :show
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    @band = Band.find_by(id: @album.band_id)
    render :show
  end

  private

  def album_params
    params.require(:album).permit(:name, :album_type, :band_id)
  end
end
