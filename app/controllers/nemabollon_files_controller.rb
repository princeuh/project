class NemabollonFilesController < ApplicationController
	before_action :logged_in_employee
	def index
		@memos = NemabollonFile.all
	end

	def new
		@memo = NemabollonFile.new
	end

	def create
		@memo = NemabollonFile.new(memo_params)
		@memo.content_creator = current_employee.email
		if @memo.save
			flash[:success] = "Your file was successfully uploaded"
			redirect_to current_employee
		else 
			flash[:error] = "Upload Unsuccessful. Please try again"
			redirect_to current_employee
		end
	end

	def destroy
		@memo = NemabollonFile.find(params[:id])
		SystemLog.new( system_event: "Memo #{@memo.memo_name} deleted from system by #{current_employee.lastname}, #{current_employee.email}.", event_time: Time.now).save
		@memo.destroy
		flash[:success] = "Memo successfully deleted"
		redirect_to current_employee
	end

	private
		def memo_params
			params.require(:memo).permit(:memo_name, :memo)
		end

		   def logged_in_employee
      unless employee_logged_in?
        flash[:danger] = "Please log in."
        redirect_to employee_account_url
      end
    end


end
