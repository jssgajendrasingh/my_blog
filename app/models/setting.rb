class Setting < ApplicationRecord
	validates :blog_name,:post_per_page,:if_maintance,presence: true
end
