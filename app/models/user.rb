class User < ApplicationRecord
  scope :invitees, -> user { where.not('name == ?', user.name).order(name: :asc) }
  
  before_save :downcase_email

  validates :name,  presence: true
  validates :email, presence: true

  has_many  :events, dependent: :destroy,
                    foreign_key: :creator_id
  has_many  :invitations
  has_many  :attended_events, class_name: "Event", through: :invitations, source: :event
  #has_and_belongs_to_many   :attended_events, class_name: "Event"

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