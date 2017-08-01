require 'show_decorator'

RSpec.describe ShowDecorator do
  describe '#display_cover' do
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

    it 'returns the empty string when cover and cover_note are nil' do
      show = instance_double('Show', cover: nil, cover_note: nil)
      decorator = ShowDecorator.new(show)
      expect(decorator.display_cover).to eq('')
    end
  end

  context 'displaying date/time' do
    # Show on April 20th, 7:30pm
    let(:decorator) do
      date = DateTime.new(2017, 4, 20, 19, 30)
      ShowDecorator.new(instance_double('Show', datetime: date, venue_name: 'Real Art'))
    end

    describe '#display_date' do
      it 'formats the date' do
        expect(decorator.display_date()).to eq('April 20')
      end
    end

    describe '#display_time' do
      it 'formats the time' do
        expect(decorator.display_time()).to eq(' 7:30 PM')
      end
    end

    describe '#display_datetime' do
      it 'formats the time' do
        expect(decorator.display_datetime()).to eq('April 20,  7:30 PM')
      end
    end

    describe '#display_machine_time' do
      it 'formats the time for an HTML5 datetime attribute' do
        expect(decorator.display_machine_time()).to eq('19:30')
      end
    end

    describe '#html_title' do
      it 'formats the date and venue name' do
        expect(decorator.html_title()).to eq('Apr 20 @ Real Art | Fang Chia')
      end
    end
  end

  context 'description' do
    it 'compiles the markdown' do
      decorator = ShowDecorator.new(instance_double('Show', description: "## H2 Title\n\nparagraph"))
      expect(decorator.description).to eq("<h2>H2 Title</h2>\n\n<p>paragraph</p>\n")
    end
  end
end
