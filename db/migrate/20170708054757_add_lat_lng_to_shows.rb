class AddLatLngToShows < ActiveRecord::Migration[5.1]
  def change
    add_column :shows, :lat, :string
    add_column :shows, :lng, :string
  end
end
