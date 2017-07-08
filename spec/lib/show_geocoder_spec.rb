require 'show_geocoder'

RSpec.describe ShowGeocoder do
  let!(:show) do
    Show = Struct.new(:venue_address, :lat, :lng, :address_changed) do
      def venue_address_changed?()
        address_changed
      end
    end

    Show.new('123 Fake St', nil, nil, true)
  end

  subject { ShowGeocoder.new }

  it 'geocodes the address when it changes' do
    expect(Geocoder).to receive(:coordinates).
      with('123 Fake St').
      and_return([123,456])

    geocoded_show = subject.geocode_show(show)

    expect(geocoded_show.lat).to eq(123)
    expect(geocoded_show.lng).to eq(456)
  end

  it 'returns the show unchanged when the address has not changed' do
    show.address_changed = false # Mock venue_address_changed?()
    expect(Geocoder).not_to receive(:coordinates)
    subject.geocode_show(show)
  end
end
