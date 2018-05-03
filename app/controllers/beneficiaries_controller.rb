class BeneficiariesController < ApplicationController
	def index
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
end
