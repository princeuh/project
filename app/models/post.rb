class Post < ApplicationRecord
  belongs_to :employee
  mount_uploader :picture, PictureUploader
end
