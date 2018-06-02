class Page < ApplicationRecord
	validates :caption, length: {maximum: 50}, presence: true
	validates :summary, length: {maximum: 350}, presence: true
	mount_uploader :picture, PictureUploader
	validate :picture_size

	private 
	#validates the size of an uploaded picture
	def picture_size
		if picture.size > 5.megabytes
			errors.add(:picture, "should be less than 100MB")
		end
	end
end
