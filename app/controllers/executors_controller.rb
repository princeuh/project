class ExecutorsController < ApplicationController
	before_action :logged_in_user
	before_action :correct_user
	def create
		@executor = current_user.executors.build(executor_params)
		if @executor.save
			flash[:success] = "Executors Saved"
			SystemLog.new( system_event: "Investor #{current_user.lastname}, #{current_user.firstname}, #{current_user.email} added Executors or Estate Admins to account.", event_time: Time.now).save
			redirect_to investor_path(@investor)
		else 
			flash[:error] = "Unable to save"
		end
	end

	def edit
		@investor = Investor.find(params[:investor_id])
		@executor = @investor.executor.find(params[:id])
	end

	def update
		@investor = Investor.find(params[:investor_id])
		@executor = @investor.executor.find(params[:id])
		if @executor.update(executor_params)
			SystemLog.new( system_event: "Investor #{current_user.lastname}, #{current_user.firstname}, #{current_user.email} updated Executors or Estate Admins on their account.", event_time: Time.now).save
			redirect_to current_user
		else
			render 'edit'
		end
	end

	def destroy
		@investor = Investor.find(params[:investor_id])
		@executor = @investor.executors.find(params[:id])
		SystemLog.new( system_event: "Investor #{current_user.lastname}, #{current_user.firstname}, #{current_user.email} removed Executors or Estate Admins on their account.", event_time: Time.now).save
		@executor.destroy
		redirect_to investor_path(@investor)
	end

	private
	def executor_params
		params.require(:executor).permit(:primary_firstname, :primary_lastname, :primary_phone_number, :primary_email, :primary_country_of_residence, :secondary_firstname, :secondary_lastname, :secondary_phone_number, :secondary_email, :secondary_country_of_residence)
	end

	def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

	def correct_user
      @user = Investor.find(params[:investor_id])
      redirect_to(root_url) unless @user == current_user
    end
end
