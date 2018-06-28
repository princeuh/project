class SystemLogsController < ApplicationController
	#only logged in users with admin status can view the system logs with all employee activity. 
	#There's no way to delete employee activity. It's set.
	before_action :logged_in_employee
	def index
		@systemlogs = SystemLog.all
	end

	private
	  def logged_in_employee
        unless employee_logged_in?
          flash[:danger] = "Please log in."
          redirect_to employee_account_url
        end
      end
end
