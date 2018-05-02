module EmployeeSessionsHelper
		#login the given employee
	def employee_login(employee)
		session[:employee_id] = employee.id
	end

	def current_employee
		@current_employee ||= Employee.find_by(id: session[:employee_id])
	end

	def employee_logged_in?
		!current_employee.nil?
	end

	def employee_logout
		session.delete(:employee_id)
		@current_employee = nil
	end
end
