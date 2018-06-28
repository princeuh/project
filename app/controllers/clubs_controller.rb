class ClubsController < ApplicationController
	before_action :logged_in_employee
	def index
		@clubs = Club.all
	end

	def new
		@club = Club.new
	end

	def create
		@club = Club.new(club_params)
		if @club.save
			flash[:success] = "Successfully created the Club."
			 SystemLog.new( system_event: "Club #{@club.name} created by #{current_employee.lastname}, #{current_employee.firstname}.", event_time: Time.now, users_id: current_employee.id).save
			redirect_to current_employee
		else
			flash[:error] = "Unable to create Club.You may be missing some information to create the club."
			redirect_to current_employee
		end
	end

	def show
		@club = Club.find(params[:id])
	end

	def edit
		@club = Club.find(params[:id])
	end

	def update
		@club = Club.find(params[:id])
		if @club.update(club_params)
			flash[:success] = "Successfully updated the Club."
			 SystemLog.new( system_event: "Club #{@club.name} created by #{current_employee.lastname}, #{current_employee.firstname}.", event_time: Time.now, users_id: current_employee.id).save
			redirect_to current_employee
		else
			flash[:error] = "Unable to update the Club.You may be missing some information."
			redirect_to current_employee
		end
	end

	def destroy
		@club = Club.find(params[:id])
		flash[:success] = "Successfully removed the Club from the database."
		SystemLog.new( system_event: "Club #{@club.name} deleted by #{current_employee.lastname}, #{current_employee.firstname}.", event_time: Time.now, users_id: current_employee.id).save
		@club.destroy

		redirect_to current_employee
	end

	private
	def club_params
		params.require(:club).permit(:name, :focus_country, :country_manager, :fund_target, :amt_invested, :number_of_members, :proposal)
	end

	 def logged_in_employee
      unless employee_logged_in?
        flash[:danger] = "Please log in."
        redirect_to employee_account_url
      end
    end
end
