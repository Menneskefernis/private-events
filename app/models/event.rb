class Event < ApplicationRecord
  scope :upcoming, -> { where('date >= ?', Date.current).order(date: :asc) }
  scope :past,     -> { where('date < ?', Date.current).order(date: :desc) }

  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true

  belongs_to :creator, class_name: "User"
  has_and_belongs_to_many   :attendees, class_name: "User"
end
