require 'geocoder'

ActiveAdmin.register Show do

  permit_params :title, :slug, :description, :datetime,
    :venue_name, :venue_url, :venue_address, :cover, :cover_note

  controller do
    # Geocode every address
    def update()
      @show = Show.find(params[:id])
      @show.assign_attributes(permitted_params[:show])

      geocoder = ShowGeocoder.new
      @show = geocoder.geocode_show(@show)
      updated_coords = @show.lat_changed? or @show.lng_changed?

      @show.save!

      flash[:notice] = updated_coords ?
        'Updated the show, including new geo coordinates for SCIENCE.' :
        'Updated the show.'

      redirect_to edit_admin_show_path(@show)
    rescue ActiveRecord::RecordInvalid => e
      flash.now[:error] = e.message()
      render :edit
    end
  end

  index do
    column :title do |show|
      link_to show.title, edit_admin_show_path(show)
    end
    column :datetime do |show|
      ShowDecorator.new(show).display_datetime()
    end
    column :venue_name
    column :cover
    column :cover_note
    actions
  end

  form do |f|
    f.semantic_errors
    inputs 'Edit Show' do
      input :title
      input :slug
      li do
        a('Markdown cheatsheet', href: 'https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet', target: '_blank')
        div class: 'markdown-guide' do
          h2 '## h2 (large heading)'
          h3 '### h3'
          h4 '#### h4'
          h5 '##### h5'
          h6 '###### h6'
          para 'paragraphs have a blank line above and below.'
          para do
            code '[Link Text](https://duckduckgo.com)'
            span ' turns into: '
            a 'Link Text', href: 'https://duckduckgo.com'
          end
          para do
            code '![Image Alt Text](http://f4.bcbits.com/img/a3760705555_7.jpg)'
            span ' turns into: '
            img 'Image Alt Text', src: 'http://f4.bcbits.com/img/a3760705555_7.jpg'
          end
        end
      end
      input :description
      div id: 'description-preview', class: 'markdown-preview'

      input :datetime

      input :venue_name
      input :venue_url
      input :venue_address
      # show computed lat/lng
      if f.object.lat.present? and f.object.lng.present?
        li do
          label 'Computed coordinates:'
          span "#{f.object.lat},#{f.object.lng}"
        end
      end

      input :cover
      input :cover_note
    end
    f.actions
  end

end
