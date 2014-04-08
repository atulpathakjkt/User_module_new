class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :firstname, presence: true, length: { maximum: 50 }
	validates :lastname, presence: true, length: { maximum: 50 }

	validates :username, presence:   true, length: { maximum: 50 },
					uniqueness: { case_sensitive: true }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


end
