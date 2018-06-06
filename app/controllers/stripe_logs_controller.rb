class StripeLogsController < ApplicationController
	protect_from_forgery :except => :create
	before_action :logged_in_employee, :only[:index]

	def index
		@logs = StripeLog.all
	end

	def create
		event_json = JSON.parse(request.body.read)
		#save to database
		@log = StripeLog.new(event_json)
		if @log.save
			#write to system logs
			SystemLog.new( system_event: "System received and saved Stripe payment data", event_time: Time.now).save
		else 
			#write to system logs
			SystemLog.new(system_event: "System received and failed to save Stripe payment data", event_time: Time.now).save
		end
	end

	private
	  def logged_in_employee
        unless employee_logged_in?
          flash[:danger] = "Please log in."
          redirect_to employee_account_url
        end
      end

end
