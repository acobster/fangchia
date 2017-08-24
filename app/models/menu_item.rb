class MenuItem < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :url
  validates_presence_of :sort_order

  validates_uniqueness_of :title
  validates_uniqueness_of :url
  validates_uniqueness_of :sort_order

  default_scope { order(:sort_order) }
end
