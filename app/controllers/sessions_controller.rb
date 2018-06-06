class SessionsController < ApplicationController
  def new
  end

  def create
  	  investor = Investor.find_by(email: params[:session][:email].downcase)
      if investor && investor.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
          log_in investor
          SystemLog.new( system_event: "Investor #{investor.email} logged into system.", event_time: Time.now)
          params[:session][:remember_me] == '1' ? remember(investor) : forget(investor)
          redirect_to investor
    else
      # Create an error message.
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end
  end

  def destroy
    SystemLog.new( system_event: "Investor #{current_user.email} logged out of system.", event_time: Time.now)
    log_out if logged_in?
    redirect_to root_url
  end
end
