class User < ApplicationRecord
  before_save :downcase_email

  validates :name,  presence: true
  validates :email, presence: true

  has_many   :events, dependent: :destroy,
                    foreign_key: :creator_id
  has_and_belongs_to_many   :attended_events, class_name: "Event"

  def upcoming_events
    attended_events.where('date >= ?', Date.current).order(date: :desc)
  end

  def previous_events
    attended_events.where('date < ?', Date.current).order(date: :desc)
  end

  private
    def downcase_email
      email.downcase!
    end
end