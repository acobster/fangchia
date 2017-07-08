class Page < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :slug
  validates_uniqueness_of :slug

  def self.home
    find_by_slug 'home'
  end

  def home?
    slug == 'home'
  end
end
