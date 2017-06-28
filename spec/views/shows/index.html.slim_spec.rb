require 'rails_helper'

RSpec.describe "shows/index", type: :view do
  before(:each) do
    assign(:shows, [
      Show.create!(
        :title => "Title",
        :slug => "Slug",
        :description => "MyText",
        :venue_name => "Venue Name",
        :venue_url => "Venue Url",
        :venue_address => "Venue Address",
        :cover => "9.99",
        :cover_note => "Cover Note"
      ),
      Show.create!(
        :title => "Title",
        :slug => "Slug",
        :description => "MyText",
        :venue_name => "Venue Name",
        :venue_url => "Venue Url",
        :venue_address => "Venue Address",
        :cover => "9.99",
        :cover_note => "Cover Note"
      )
    ])
  end

  it "renders a list of shows" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Venue Name".to_s, :count => 2
    assert_select "tr>td", :text => "Venue Url".to_s, :count => 2
    assert_select "tr>td", :text => "Venue Address".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Cover Note".to_s, :count => 2
  end
end
