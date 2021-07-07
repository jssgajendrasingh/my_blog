class Tag < ApplicationRecord
	has_many :articles,through: :article_tags
	validates :name,presence: true
end
