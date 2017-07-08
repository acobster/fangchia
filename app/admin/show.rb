require 'geocoder'

ActiveAdmin.register Show do

  permit_params :title, :slug, :description, :datetime,
    :venue_name, :venue_url, :venue_address, :cover, :cover_note

  controller do
    # Geocode every address
    def update()
      @show = Show.find(params[:id])
      @show.assign_attributes(permitted_params[:show])

      geocoder = ShowGeocoder.new
      @show = geocoder.geocode_show(@show)
      updated_coords = @show.lat_changed? or @show.lng_changed?

      @show.save!

      flash[:notice] = updated_coords ?
        'Updated the show, including new geo coordinates for SCIENCE.' :
        'Updated the show.'

      redirect_to edit_admin_show_path(@show)
    rescue ActiveRecord::RecordInvalid => e
      flash.now[:error] = e.message()
      render :edit
    end
  end

  index do
    column :title do |show|
      link_to show.title, edit_admin_show_path(show)
    end
    column :datetime do |show|
      ShowDecorator.new(show).display_datetime()
    end
    column :venue_name
    column :cover
    column :cover_note
    actions
  end

end
