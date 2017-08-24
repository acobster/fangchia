class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.integer :sort_order, null: false

      t.timestamps
    end
  end
end
