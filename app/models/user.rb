class User < ApplicationRecord
  before_save :downcase_email

  validates :name,  presence: true
  validates :email, presence: true

  has_many   :events, dependent: :destroy,
                    foreign_key: :creator_id
  has_many :attended_events, class_name: "Event"

  private
    def downcase_email
      email.downcase!
    end
end