ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  titles = [
    'The Fuck Everything Administrative Center',
    'The Both List',
    'Constantly Expanding in All Directions',
    'Seriously, where would you that we gather?',
    'Warner House Cat Tribute Band Website',
    'U.S. Department of Defense',
    'DISCIPLINE',
    'Rat Farm Command Console',
  ]

  # TODO figure out how to bust caching, maybe on login?
  content title: titles.sample do
    columns do
      column do
        panel "Upcoming" do
          upcoming_shows = Show.upcoming
          ul do
            upcoming_shows.map {|show| ShowDecorator.new(show)}.map do |show|
              summary = show.display_date()+' @ '+show.venue_name
              li link_to(summary, edit_admin_show_path(show.show))
            end
          end

          if upcoming_shows.empty?
            para 'Nothing booked at the moment.'
          end
        end

        panel "Past" do
          past_shows = Show.past

          ul do
            past_shows.map {|show| ShowDecorator.new(show)}.map do |show|
              summary = show.display_date()+' @ '+show.venue_name
              li link_to(summary, edit_admin_show_path(show.show))
            end
          end

          if past_shows.empty?
            para 'Apparently we\'ve never played a show before.'
          end
        end
      end

      column do
        panel 'Pages' do
          ul do
            Page.all.map do |page|
              title = page.title
              title = title + ' (Home)' if page.home?
              li link_to(title, edit_admin_page_path(page))
            end
          end
        end
      end
    end
  end

end
