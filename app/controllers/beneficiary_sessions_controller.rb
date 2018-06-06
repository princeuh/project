class BeneficiarySessionsController < ApplicationController
  def new
  end

  def create
  	 beneficiary = Beneficiary.find_by(email: params[:beneficiary_session][:email].downcase)
    if beneficiary && beneficiary.authenticate(params[:beneficiary_session][:password])
      # Log the user in and redirect to the user's show page.
          beneficiary_log_in beneficiary
          SystemLog.new( system_event: "Beneficiary #{beneficiary.email} logged into system.", event_time: Time.now).save
          params[:beneficiary_session][:remember_me] == '1' ? remember(beneficiary) : forget_b(beneficiary)
          redirect_to beneficiary
    else
      # Create an error message.
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end
  end

  def destroy
    SystemLog.new( system_event: "Beneficiary #{beneficiary.email} logged out of the system.", event_time: Time.now).save
    beneficiary_log_out if beneficiary_logged_in?
    redirect_to root_url
  end
end

