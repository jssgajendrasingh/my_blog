require 'bcrypt'
class User < ApplicationRecord
	has_secure_password
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
	has_many :articles
	validates :first_name,:about,:email,:password_digest, presence: true
  	validates :email, uniqueness: true,format: { with: VALID_EMAIL_REGEX }
  	validates :first_name, length: {minimum: 3}
  	validates :password_digest , length: {minimum: 6}

end
