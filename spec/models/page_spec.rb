require 'rails_helper'

RSpec.describe Page, type: :model do
  it 'has a home page' do
    home_page = Page.create!({slug: 'home', title: 'The Home Page'})
    Page.create!({slug: 'other', title: 'Some Other Page'})
    expect(Page.home).to eq(home_page)
  end
end
