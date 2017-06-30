require 'rails_helper'

RSpec.describe Show, type: :model do
  let!('past_show') do
    Show.create!({slug: 'past-show',
                  title: 'Show in the Past',
                  datetime: '2017-01-01'})
  end

  let!('upcoming_show') do
    Show.create!({slug: 'upcoming-show',
                  title: 'Far Future Cyborg Fang Chia',
                  datetime: '2525-12-31'})
  end

  it 'gets upcoming shows' do
    expect(Show.upcoming).to eq([upcoming_show])
  end

  it 'gets past shows' do
    expect(Show.past).to eq([past_show])
  end
end
