class ClubMembersController < ApplicationController
	before_action :logged_in_user, only: [:create]
	before_action :correct_user, only: [:create]
	before_action :logged_in_employee, only: [:destroy]
	def create
		@member = ClubMember.new(club_member_params)
		if @member.save
			flash[:success] = "You are a member"
			SystemLog.new( system_event: " #{@member.investor_id.lastname},  #{@member.investor_id.email } joined #{@member.club_id.name} and invested #{@member.amount_invested} ", event_time: Time.now, users_id: @member.investor_id).save
		else 
			flash[:error] = "Unable to process request. Please try again or contact an admin"
			
		end
	end

	def destroy
		@member = ClubMember.find(params[:id])
		 SystemLog.new( system_event: "#{@member.investor_id.lastname} is not a club member of #{@member.club_id.name} removed by #{current_employee.lastname},  #{current_employee.firstname}.", event_time: Time.now, users_id: current_employee.id).save
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

     def logged_in_employee
      unless employee_logged_in?
        flash[:danger] = "Please log in."
        redirect_to employee_login_path
      end
    end
end
