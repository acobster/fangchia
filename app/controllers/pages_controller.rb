class PagesController < ApplicationController

  def index
    @page = Page.home
  end

  # GET /pages/1
  def show
    @page = Page.find_by_slug(params[:slug])
  end

end
