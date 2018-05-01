module ClubMembersHelper
	def find_investor?
		if logged_in?
			!ClubMember.find_by(investor_id: current_user.id).nil?
		end
	end
end
