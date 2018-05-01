class ClubMembersController < ApplicationController
	def create
		@member = ClubMember.new(club_member_params)
		if @member.save
			flash[:success] = "You are a member"
		else 
			flash[:error] = "Unable to process request. Please try again or contact an admin"
		end
	end

	def destroy
		@member = ClubMember.find(params[:id])
		@member.destroy
	end

	private
	def club_member_params
		params.require(:club_member).permit(:investor_id, :club_id , :amount_invested)
	end
end
