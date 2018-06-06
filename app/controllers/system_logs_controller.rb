class SystemLogsController < ApplicationController
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
