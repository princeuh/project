class ExecutorsController < ApplicationController
	def create
		@executor = current_user.executors.build(executor_params)
		if @executor.save
			flash[:success] = "Executors Saved"
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
			redirect_to current_user
		else
			render 'edit'
		end
	end

	def destroy
		@investor = Investor.find(params[:investor_id])
		@executor = @investor.executors.find(params[:id])
		@executor.destroy
		redirect_to investor_path(@investor)
	end

	private
	def executor_params
		params.require(:executor).permit(:primary_firstname, :primary_lastname, :primary_phone_number, :primary_email, :primary_country_of_residence, :secondary_firstname, :secondary_lastname, :secondary_phone_number, :secondary_email, :secondary_country_of_residence)
	end
end
