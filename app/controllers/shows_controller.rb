class ShowsController < ApplicationController
  # GET /shows
  def index
    @shows = Show.all
  end

  # GET /shows/some-show
  def show
    @show = Show.find_by_slug(params[:slug])
  end
end
