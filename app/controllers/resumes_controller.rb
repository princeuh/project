class ResumesController < ApplicationController
  def index
  	@resumes = Resume.all
  end

  def new
  	@resume = Resume.new
  end

  def create
  	@resume = Resume.new(resume_params)
  	if @resume.save
  		log_in @resume
  		flash[:success] = "Your application has been submitted. Please use the Application Status link to track your status."
  		redirect_to @resume
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
     	params.require(:resume).permit(:firstname, :lastname, :bioSketch, :attachment)
     end

     def status_params
     	params.require(:resume).permit(:email, :password)
     end
end
