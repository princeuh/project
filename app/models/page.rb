class Page < ApplicationRecord
	validates :caption, length: {maximum: 50}, presence: true
	validates :summary, length: {maximum: 350}, presence: true
	mount_uploader :highlight, HighlightUploader
	validate :picture_size

	private 
	#validates the size of an uploaded picture
	def picture_size
		if highlight.size > 10.megabytes
			errors.add(:highlight, "should be less than 10MB")
		end
	end
end
