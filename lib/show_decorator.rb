require 'active_support'
require 'active_support/core_ext/object'
require 'rdiscount'

class ShowDecorator
  attr_reader :show

  def initialize(show)
    @show = show
  end

  def method_missing(name, *args, &block)
    @show.send(name, *args, &block)
  end

  def display_cover()
    return cover_note if cover_note.present?
    return '' if cover.nil?

    # display whole-dollar prices without decimals
    format = (cover.round == cover) ? '$%d' : '$%.2f'
    sprintf(format, cover)
  end

  def display_time()
    datetime.strftime('%l:%M %p')
  end

  def display_date()
    datetime.strftime('%B %e')
  end

  def display_datetime()
    datetime.strftime('%B %e, %l:%M %p')
  end

  def display_machine_time()
    datetime.strftime('%H:%M')
  end

  def html_title()
    datetime.strftime('%b %e')+' @ '+venue_name+' | Fang Chia'
  end

  def description()
    markdown = RDiscount.new(@show.description)
    markdown.to_html().html_safe()
  end
end
