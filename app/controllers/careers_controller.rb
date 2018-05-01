class CareersController < ApplicationController
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
      redirect_to @career
    else
      render 'edit'
    end
  end

  def destroy
    @career = Career.find(params[:id])
    @career.destroy

    redirect_to careers_path
  end

  private
	def career_params
		params.require(:career).permit(:job_title, :department, :posting, :posting_date)
	end
end
