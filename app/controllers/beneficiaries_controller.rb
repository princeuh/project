class BeneficiariesController < ApplicationController
	 before_action :logged_in_beneficiary, only: [ :edit, :update, :destroy]
	 before_action :logged_in_employee, only: [:index]
	def index
		@beneficaries = Beneficiary.all
	end

	def new
		@beneficiary = Beneficiary.new
	end

	def create
		@beneficiary = Beneficiary.new(ben_params)
		if @beneficiary.save
			redirect_to @beneficiary
		else
			flash[:error] = "Unable to create account. Please try again." 
			render 'new'
		end
	end


	def edit

	end

	def show
		@beneficiary = Beneficiary.find(params[:id])
	end

	def update
	end


	def destroy
	end

	private
	def ben_params
		params.require(:beneficiary).permit(:firstname, :lastname, :email, :password,
                                   :password_confirmation, :country, :address, :city, :phone_number)
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
