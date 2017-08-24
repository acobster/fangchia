ActiveAdmin.register MenuItem do
  include ActiveAdmin::SortableTable
  config.sort_order = 'sort_order_asc'

  permit_params :title, :url, :sort_order

  index do
    handle_column
    column :sort_order
    column :title
    column :url
  end
end
