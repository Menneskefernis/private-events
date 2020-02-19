class User < ApplicationRecord
  before_save :downcase_email

  private
    def downcase_email
      email.downcase!
    end
end
