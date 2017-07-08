require 'geocoder'

class ShowGeocoder
  def geocode_show(show)
    if show.venue_address_changed?()
      lat, lng = Geocoder.coordinates(show.venue_address)

      if lat and lng
        show.lat = lat
        show.lng = lng
      end
    end

    show
  end
end
