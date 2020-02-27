class Event < ApplicationRecord
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true

  belongs_to :creator, class_name: "User"
  has_many   :attendees, dependent: :destroy,
                         foreign_key: :attendee_id
end
