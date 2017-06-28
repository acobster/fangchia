class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.datetime :datetime
      t.string :venue_name
      t.string :venue_url
      t.string :venue_address
      t.decimal :cover
      t.string :cover_note

      t.timestamps
    end
  end
end
