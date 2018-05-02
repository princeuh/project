class EmployeeSessionsController < ApplicationController
  def new
  end

  def create
  	employee = Employee.find_by(email: params[:employee_session][:email].downcase)
    if employee && employee.authenticate(params[:employee_session][:password])
      # Log the user in and redirect to the user's show page.
      employee_login employee
      redirect_to employee
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  	employee_logout
  	redirect_to root_url
  end
end
