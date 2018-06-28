class ResumesController < ApplicationController
  before_action :logged_in_employee, only: [:index]
  def index
  	@resumes = Resume.all
  end

  def new
  	@resume = Resume.new
  end

  def create
    @career = Career.find(params[:career_id])
    @resume  = @career.resumes.create(resume_params)
  	if @resume.save
  		status_log_in @resume
      SystemLog.new( system_event: "New resume for #{@resume.lastname} for #{@career.job_title}  added to system", event_time: Time.now, users_id: @resume.id ).save
  		flash[:success] = "Your application has been submitted. Please use the Application Status link to track your status."
  		redirect_to career_resume_path(user.career_id, user.id)
  	else
  		flash[:error] = "Something went wrong. Unable to submit your application. Please try again."
  		render 'new'
  	end
  end

  def show
  	@resume = Resume.find(params[:id])
  end

  def status
  	@status = Resume.find_by(email: params[:email])
  end

  private
     def resume_params
     	params.require(:resume).permit(:firstname, :lastname, :bioSketch, :attachment, :email, :password, :password_confirmation)
     end

     def status_params
     	params.require(:resume).permit(:email, :password)
     end

      def logged_in_employee
        unless employee_logged_in?
          flash[:danger] = "Please log in."
          redirect_to root_url
        end
      end
end
