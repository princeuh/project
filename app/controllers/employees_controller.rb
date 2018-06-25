class EmployeesController < ApplicationController
  before_action :logged_in_employee

	def index
    	@employees = Employee.all
  	end
  
  def new
  	@employee = Employee.new
  end

  def create
  	@employee = Employee.new(employee_params)
    @employee.email = "#{@employee.lastname}#{@employee.firstname}77@nemabollon.com"
    @employee.password = "nemabollon77"
    @employee.avatar = "none"
    @employee.user_type = "employee"
  	if @employee.save
  		#saved and logged in employee
      SystemLog.new( system_event: "Employee account created for #{@employee.lastname},  #{@employee.firstname},  #{@employee.email} by #{current_employee.lastname}, #{current_employee.firstname},  #{current_employee.email} .", event_time: Time.now).save
      flash[:success] = "Successfully created employee account"
      redirect_to current_employee
  	else
      flash[:error] = "Could not create employee account"
  		redirect_to current_employee
  	end
  end

  def show
  	@employee = Employee.find(params[:id])
    @allEmployees = Employee.all
    @investor= Investor.all
    @clubs = Club.all
    @beneficiaries = Beneficiary.all
    @logs = SystemLog.all
    @proposals = Proposal.all
     @club_updates = ClubUpdate.all
     @memos = NemabollonFile.all
     @events = EmployeeCalendar.all
     @posts = Post.all
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:success] = "Successfully Updated your Account"
      SystemLog.new( system_event: "Employee account updated for #{@employee.lastname},  #{@employee.firstname},  #{@employee.email} by #{current_employee.lastname}, #{current_employee.firstname},  #{current_employee.email} .", event_time: Time.now).save
      redirect_to @employee
    else
      flash[:error] = "Could not update your account"
      redirect_to @employee
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    SystemLog.new( system_event: "Employee account destroyed for #{@employee.lastname},  #{@employee.firstname},  #{@employee.email} by #{current_employee.lastname},  #{current_employee.firstname},  #{current_employee.email} .", event_time: Time.now).save
    @employee.destroy

    redirect_to employees_path
  end

   private
	def employee_params
		params.require(:employee).permit(:firstname, :lastname, :role, :email,  :password, :password_confirmation, :is_admin, :job_category, :job_location, :reports_to, :department, :section, :contact_number, :employee_pid, :employee_rank)
	end

   def logged_in_employee
      unless employee_logged_in?
        flash[:danger] = "Please log in."
        redirect_to employee_account_url
      end
    end
end

