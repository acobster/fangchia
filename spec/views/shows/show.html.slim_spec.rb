require 'rails_helper'

RSpec.describe "shows/show", type: :view do
  before(:each) do
    @show = assign(:show, Show.create!(
      :title => "Title",
      :slug => "Slug",
      :description => "MyText",
      :venue_name => "Venue Name",
      :venue_url => "Venue Url",
      :venue_address => "Venue Address",
      :cover => "9.99",
      :cover_note => "Cover Note"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Venue Name/)
    expect(rendered).to match(/Venue Url/)
    expect(rendered).to match(/Venue Address/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Cover Note/)
  end
end
