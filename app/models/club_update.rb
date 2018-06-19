class ClubUpdate < ApplicationRecord
	validates :title, presence: true
	validates :content, presence: true
  validates :subtitle, presence: true
	mount_uploader :picture
end
