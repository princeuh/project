class EmployeeCalendarController < ApplicationController
	def index
		@events = EmployeeCalendar.all
	end

	def new
	end

	def create
		@event = EmployeeCalendar.new(cal_params)
		if @event.save
			SystemLog.new( system_event: "#{current_employee.lastname} created an event", event_time: Time.now, users_id: current_employee.id).save
			flash[:success] = "Your objective has been successfully created."
			redirect_to current_employee
		else 
			flash[:error] = "Unable to save your objective. Please make another attempt."
			redirect_to current_employee
		end
	end

	def edit
		@event  = EmployeeCalendar.find(params[:id])
	end

	def show
		@event  = EmployeeCalendar.find(params[:id])
	end

	def update
		@event  = EmployeeCalendar.find(params[:id])
		if @event.update(cal_params)
      		flash[:success] = "Successfully updated your Event"
      		SystemLog.new( system_event: "#{current_employee.lastname} updated an event", event_time: Time.now, users_id: current_employee.id).save
      		redirect_to current_employee
    	else
      		flash[:error] = "Could not update the Objective"
      		redirect_to current_employee
    	end
	end

	def destroy
		@event  = EmployeeCalendar.find(params[:id])
		@event.destroy
		SystemLog.new( system_event: "#{current_employee.lastname} deleted an event", event_time: Time.now, users_id: current_employee.id).save
		flash[:success] = "Your objective was successfully deleted."
		redirect_to current_employee
	end

	private
	def cal_params
		params.require(:employee_calendar).permit(:objective, :day, :month, :year, :author)
	end
end
