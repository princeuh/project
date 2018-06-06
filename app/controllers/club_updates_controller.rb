class ClubUpdatesController < ApplicationController
	before_action :logged_in_employee, only: [:new, :create, :edit, :update, :destroy, :show]
	#view all clubupdates to be used as the app's blog on the social media tools
	def index
		@clubupdates = ClubUpdate.all
	end

	#appropriate employees create a new clubupdate
	def new
		@clubupdate = ClubUpdate.new
	end

	#the new clubupdate is saved
	def create
		 @clubupdate = ClubUpdate.new(clubupdate_params)
  		if @clubupdate.save
  		#saved and logged in employee
      		SystemLog.new( system_event: "Blog clubupdate #{@club_update.title} created by #{current_employee.lastname}, #{current_employee.firstname}.", event_time: Time.now).save
      		redirect_to @clubupdate
  		else
  			render 'new'
  		end
	end

	def show
		@clubupdate = ClubUpdate.find(params[:club_update_id])
	end

	#appropriate employees can edit a clubupdate
	def edit
		@clubupdate = ClubUpdate.find(params[:club_update_id])
	end

	#appropriate employees can update a clubupdate
	def update
		@clubupdate = ClubUpdate.find(params[:id])
		if @clubupdate.update(club_params)
			SystemLog.new( system_event: "Blog clubupdate #{@club_update.title} updated by #{current_employee.lastname}, #{current_employee.firstname}.", event_time: Time.now).save
			redirect_to @clubupdate
		else
			render 'edit'
		end
	end

	#appropriate employees can destroy a clubupdate
	def destroy
		@clubupdate = ClubUpdate.find(params[:id])
		SystemLog.new( system_event: "Blog clubupdate #{@club_update.title} deleted from system by #{current_employee.lastname}, #{current_employee.firstname}.", event_time: Time.now).save
		@clubupdate.destroy
		redirect_to clubupdates_path
	end

	#clubupdate parameters are sent through strong params
	private
		def clubupdate_params
			params.require(:clubupdate).permit(:title, :content, :picture)
		end

		def logged_in_employee
      		unless employee_logged_in?
        	flash[:danger] = "Please log in."
        	redirect_to employee_account_url
      		end
    	end

end