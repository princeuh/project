class BeneficiarySessionsController < ApplicationController
    def new
  end

  def create
  	  beneficiary = Beneficiary.find_by(email: params[:beneficiary_session][:email].downcase)
    if beneficiary && beneficiary.authenticate(params[:beneficiary_session][:password])
      # Log the user in and redirect to the user's show page.
          log_in beneficiary
          params[:beneficiary_session][:remember_me] == '1' ? remember(beneficiary) : forget(beneficiary)
          redirect_to beneficiary
    else
      # Create an error message.
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end
  end

  def destroy
    beneficiary_log_out if beneficiary_logged_in?
    redirect_to root_url
  end
end
