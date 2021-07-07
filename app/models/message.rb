class Message < ApplicationRecord
	has_many :notification, as: :notifiable 
	validates :fullname,:email, :content, presence: true
end
