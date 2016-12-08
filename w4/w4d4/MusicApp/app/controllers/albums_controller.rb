class AlbumsController < ApplicationController
  def new
    @album = Album.new
    @band = Band.find_by(id: params[:band_id])
    render :new
  end

  def create
    @band = Band.find_by(id: params[:album][:band_id])
    @album = Album.new(band_id: @band.id,
                       name: params[:album][:name],
                       album_type: params[:album][:album_type])

    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    @band = Band.find_by(id: @album.band_id)
    render :show
  end
end
