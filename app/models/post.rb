class Post < ApplicationRecord
  belongs_to :employee
  mount_uploader :highlight
end
