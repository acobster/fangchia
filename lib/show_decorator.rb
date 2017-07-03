class ShowDecorator
  def initialize(show)
    @show = show
  end

  def method_missing(name, *args, &block)
    @show.send(name, *args, &block)
  end

  def display_cover()
    return cover_note unless cover_note.empty?

    # display whole-dollar prices without decimals
    format = (cover.round == cover) ? '$%d' : '$%.2f'
    sprintf(format, cover)
  end
end
