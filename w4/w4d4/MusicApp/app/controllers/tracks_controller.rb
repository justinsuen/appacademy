class TracksController < ApplicationController
  before_action :require_user!

  def new
    @track = Track.new
    @album = Album.find_by(id: params[:album_id])
    render :new
  end

  def create
    @album = Album.find_by(id: params[:track][:album_id])
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])
    @album = Album.find_by(id: @track.album_id)
    render :edit
  end

  def update
    @track = Track.find_by(id: params[:id])
    @album = Album.find_by(id: @track.album_id)

    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    @album = Album.find_by(id: @track.album_id)

    if @track
      Track.destroy(params[:id])
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :show
    end
  end

  def show
    @track = Track.find_by(id: params[:id])
    @album = Album.find_by(id: @track.album_id)
    render :show
  end

  private

  def track_params
    params.require(:track).permit(:album_id, :name, :track_type, :lyrics)
  end
end
