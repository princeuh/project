class BeneficiaryProjectController < ApplicationController
	before_action :logged_in_beneficiary, only: [:edit, :update, :destroy]
	before_action :logged_in_employee, only: [:index]
	before_action :correct_user

	def index
		@projects = BeneficiaryProject.all
	end

	def create 
		@beneficiary = Beneficiary.find(params[:beneficiary_id])
		@project = @beneficiary.beneficiaryproject.create(proj_params)
		if @project.save
			#redirect to the proposal show page
			SystemLog.new( system_event: "#{current_user.lastname}, #{current_user.email} created a proposal #{@proposal.title}", event_time: Time.now).save
			flash[:success] = "Your proposal has been successfully submitted. View the status of all Proposals by clicking the Proposal Tab."
			redirect_to current_user
		else
			render current_user
		end
	end

	def edit
		@project = BeneficiaryProject.find(params[:id])
	end

	def update
		@project = BeneficiaryProject.find(params[:id])
		if @project.update(proj_params)
			SystemLog.new( system_event: "Beneficiary Project updated by #{current_user.lastname}, #{current_user.enterprise_name}.", event_time: Time.now).save
			flash[:success] = "Your account has been updated."
			redirect_to current_user
		else 
			flash[:error] = "Unable to update account. Please try again."
			redirect_to current_user
		end
	end

	def destroy
		@project = BeneficiaryProject.find(params[:id])
		SystemLog.new( system_event: " #{@project.title}  deleted by #{current_user.lastname}, #{current_user.firstname} ", event_time: Time.now).save
		@project .destroy
		redirect_to current_user
	end



	private
	def proj_params
		params.require(:beneficiary_project).permit(:title, :introduction, :description, :company_description,
                                   :enterprise_particulars, :marketing, :human_resources, :collateral_fund, :management, :project_financing, :financial_analysis, :economic_analysis, :social_implications, :environmental_implications, :transport_impacts, :conclusion )
	end

	def correct_user
      @user = Beneficiary.find(params[:beneficiary_id])
      redirect_to(root_url) unless @user == current_user
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
