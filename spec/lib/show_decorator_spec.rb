require 'show_decorator'

RSpec.describe ShowDecorator do
  describe '#cover_note' do
    it 'displays whole-dollar prices' do
      show = instance_double('Show', cover: 5.0, cover_note: '')
      decorator = ShowDecorator.new(show)
      expect(decorator.display_cover).to eq('$5')
    end

    it 'displays decimal prices' do
      show = instance_double('Show', cover: 5.25, cover_note: '')
      decorator = ShowDecorator.new(show)
      expect(decorator.display_cover).to eq('$5.25')
    end

    it 'replaces cover with cover_note' do
      show = instance_double('Show', cover: 3.0, cover_note: '$5 suggested')
      decorator = ShowDecorator.new(show)
      expect(decorator.display_cover).to eq('$5 suggested')
    end
  end
end
