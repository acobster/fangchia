class DefaultPageContent < ActiveRecord::Migration[5.1]
  def up
    change_column :pages, :content, :text, default: ''
  end

  def down
    change_column :pages, :content, :text
  end
end
