class LinksController < ApplicationController
  before_filter :require_logged_in!

  def index
    @links = Link.all
    render :index
  end
end
