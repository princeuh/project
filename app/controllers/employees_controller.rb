class EmployeesController < ApplicationController
	def index
    	@employees = Employee.all
  	end
  
  def new
  	@employee = Employee.new
  end

  def create
  	@employee = Employee.new(employee_params)
  	if @employee.save
  		#saved and logged in employee
      flash[:success] = "Successfully created employee account"
      redirect_to @employee
  	else
  		render 'new'
  	end
  end

  def show
  	@employee = Employee.find(params[:id])
    @allEmployees = Employee.all
    @investor= Investor.all
    @clubs = Club.all

  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render 'edit'
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to employees_path
  end

   private
	def employee_params
		params.require(:employee).permit(:firstname, :lastname, :role, :email, :password, :password_confirmation, :is_admin, :job_category, :job_location, :reports_to, :department, :section, :contact_number, :employee_pid)
	end

end

