class Post < ApplicationRecord
  belongs_to :employee
  mount_uploader :picture, PictureUploader
  validate :picture_size

  private
  def picture_size
  	if picture.size > 5.megabytes
  		errors.add(:picture, "shoould be less than 5MB")
 	end
  end
end
