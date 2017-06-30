class PagesController < ApplicationController

  # GET /pages/1
  def show
    @show = Page.find_by_slug(params[:slug])
  end

end
