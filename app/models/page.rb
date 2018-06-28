class Page < ApplicationRecord
	validates :caption, length: {maximum: 50}, presence: true
	validates :summary, length: {maximum: 350}, presence: true
	mount_uploader :picture

end
