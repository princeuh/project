class StatusSessionsController < ApplicationController
	def new
	end

	def create
		user = Resume.find_by(email: params[:status_session][:email].downcase)
    	if user && user.authenticate(params[:status_session][:password])
      # Log the user in and redirect to the user's show page.
      		status_log_in user
          SystemLog.new( system_event: "#{user.lastname} with resume #{user.email} logged into system to check resume status ", event_time: Time.now).save
      		#redirect_to user
          redirect_to career_resume_path(user.career_id, user.id)
    	else
      # Create an error message.
      		flash.now[:danger] = 'Invalid email/password combination'
      		render root_url
     end
    end

    def destroy
      SystemLog.new( system_event: "#{@resume_current_user} with resume logged out of system ", event_time: Time.now).save
    	status_log_out
    	redirect_to root_url
  	end
end
