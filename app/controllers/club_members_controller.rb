class ClubMembersController < ApplicationController
	before_action :logged_in_user
	before_action :correct_user
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
	def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

	def correct_user
      @user = Investor.find(params[:investor_id])
      redirect_to(root_url) unless @user == current_user
    end
end
