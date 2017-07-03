class ShowsController < ApplicationController
  before_action :load_env

  # GET /shows
  def index
    @shows = Show.all
  end

  # GET /shows/some-show
  def show
    @show = ShowDecorator.new(Show.find_by_slug(params[:slug]))
    @api_key = ENV['GOOGLE_MAPS_API_KEY']
  end
end
