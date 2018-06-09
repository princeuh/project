class NemabollonFile < ApplicationRecord
	mount_uploader :memo
	validates :content_creator, presence: true
end
