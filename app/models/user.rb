require 'bcrypt'
class User < ApplicationRecord
	has_secure_password
	has_many :articles
	validates :first_name,:about,:email,:password_digest, presence: true
  	validates :email, uniqueness: true
  	validates :first_name, length: {minimum: 3}
end
