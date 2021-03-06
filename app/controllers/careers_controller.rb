class CareersController < ApplicationController
  before_action :logged_in_employee
	def index
    	@careers = Career.all
  	end
  
  def new
  	@career = Career.new
  end
  

  def create
  	@career = Career.new(career_params)
  	if @career.save
  		#saved and logged in employee
      SystemLog.new( system_event: "Career #{@career.job_title} created by #{current_employee.lastname}, #{current_employee.firstname}.", event_time: Time.now, users_id: current_employee.id).save
      redirect_to @career
  	else
  		render 'new'
  	end
  end

  def show
  	@career = Career.find(params[:id])
  end

  def edit
    @career = Career.find(params[:id])
  end

  def update
    @career = Career.find(params[:id])
    if @career.update(career_params)
       SystemLog.new( system_event: "Career #{@career.job_title} updated by #{current_employee.lastname}, #{current_employee.firstname}.", event_time: Time.now, users_id: current_employee.id).save
      redirect_to @career
    else
      render 'edit'
    end
  end

  def destroy
    @career = Career.find(params[:id])
    SystemLog.new( system_event: "Career #{@career.job_title} destroyed by #{current_employee.lastname}, #{current_employee.firstname}.", event_time: Time.now, users_id: current_employee.id).save
    @career.destroy
    redirect_to careers_path
  end



  private
	def career_params
		params.require(:career).permit(:job_title, :department, :posting, :posting_date)
	end


    def logged_in_employee
      unless employee_logged_in?
        flash[:danger] = "Please log in."
        redirect_to employee_login_path
      end
    end


end
