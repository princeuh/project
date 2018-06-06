class ClubUpdate < ApplicationRecord
	validates :title, presence: true
	validates :content, presence: true
	  mount_uploader :picture, PictureUploader
  	  validate :picture_size
end
