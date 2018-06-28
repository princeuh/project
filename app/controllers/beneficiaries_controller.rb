class BeneficiariesController < ApplicationController
	#resource for the Enterprise being funded
	 before_action :logged_in_beneficiary, only: [ :edit, :update] #only beneficiaries that are logged in may edit, update their profile
	 before_action :logged_in_employee, only: [:index, :destroy] #only employees that are logged in may view all beneficiaries and delete a beneficiary once a delete request is received 
	#lists all the beneficiaries in the system can only be viewed by an employee with correct credentials
	def index
		@beneficaries = Beneficiary.all
	end

	#creates a new beneficiary object
	def new
		@beneficiary = Beneficiary.new
	end

	#creates and saves the beneficiary to the database
	def create
		@beneficiary = Beneficiary.new(ben_params)
		if @beneficiary.save
			log_in @beneficiary
			 @beneficiary.send_activation_email
			SystemLog.new( system_event: "Beneficiary account created  by #{@beneficiary.lastname}, #{@beneficiary.enterprise_name}.", event_time: Time.now, users_id: @beneficiary.id ).save
      		flash[:success] = "Welcome to your Nemabollon Account"
			redirect_to @beneficiary
		else
			flash[:error] = "Unable to create account. Please try again." 
			redirect_to @beneficiary
		end
	end

	#edits the beneficiaries data
	def edit
		@beneficiary = Beneficiary.find(params[:id])
	end

	#shows this beneficiaries dashboard
	def show
		@beneficiary = Beneficiary.find(params[:id])
		@clubs = Club.all
		@club_updates = ClubUpdate.all
		@projplans = BeneficiaryProject.where(beneficiary_id: current_user.id)
	end

	#allows the beneficiary to update their data
	def update
		@beneficiary = Beneficiary.find(params[:id])
		if @beneficiary.update(ben_params)
			SystemLog.new( system_event: "Beneficiary account updated by #{@beneficiary.lastname}, #{@beneficiary.enterprise_name}.", event_time: Time.now, users_id: @beneficiary.id).save
			flash[:success] = "Your account has been updated."
			redirect_to @beneficiary
		else 
			flash[:error] = "Unable to update account. Please try again."
			redirect_to @beneficiary
		end
	end

	#allows the employee to destroy the beneficiary
	def destroy
		@beneficiary = Beneficiary.find(params[:id])
		SystemLog.new( system_event: " #{ @beneficiary.enterprise_name} account deleted by #{current_employee.lastname}, #{current_employee.firstname} ", event_time: Time.now, users_id: @beneficiary.id).save
		@beneficiary.destroy
		redirect_to beneficiaries_path
	end



	private
	def ben_params
		params.require(:beneficiary).permit(:firstname, :lastname, :email, :password,
                                   :password_confirmation, :country, :enterprise_name, :address, :city, :phone_number)
	end

	 def logged_in_beneficiary
      unless beneficiary_logged_in?
        flash[:danger] = "Please log in."
        redirect_to beneficiary_login_url
      end
    end

    def logged_in_employee
      unless employee_logged_in?
        flash[:danger] = "Please log in."
        redirect_to employee_account_url
      end
    end
end
