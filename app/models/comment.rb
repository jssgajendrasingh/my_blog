class Comment < ApplicationRecord
	belongs_to :article
	has_many :notifications, as: :notifiable
	validates :fullname,:email,:message,presence: true
end
