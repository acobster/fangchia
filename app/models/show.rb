class Show < ApplicationRecord
  validates_presence_of :datetime
  validates_presence_of :slug
  validates_uniqueness_of :slug
  validates_presence_of :title

  scope :upcoming, -> { where('datetime > ?', Time.now) }
  scope :past, -> { where('datetime < ?', Time.now) }
end
