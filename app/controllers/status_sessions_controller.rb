class StatusSessionsController < ApplicationController
	def new
	end

	def create
		user = Resume.find_by(email: params[:session][:email].downcase)
    	if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      		status_log_in user
      		redirect_to user
    	else
      # Create an error message.
      		flash.now[:danger] = 'Invalid email/password combination'
      		render root_url
     end

    def destroy
    	status_log_out
    	redirect_to root_url
  	end
end
