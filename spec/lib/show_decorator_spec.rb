require 'show_decorator'

RSpec.describe ShowDecorator do
  it 'displays whole-dollar prices' do
    show = instance_double('Show', cover: 5.0)
    decorator = ShowDecorator.new(show)
    expect(decorator.display_cover).to eq('$5')
  end

  it 'displays decimal prices' do
    show = instance_double('Show', cover: 5.25)
    decorator = ShowDecorator.new(show)
    expect(decorator.display_cover).to eq('$5.25')
  end
end
