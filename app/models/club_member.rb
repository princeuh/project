class ClubMember < ApplicationRecord
	validates :investor_id, presence: true
	validates :club_id, presence: true

end
