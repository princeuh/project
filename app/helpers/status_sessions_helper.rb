module StatusSessionsHelper
	 def status_log_in(user)
    	session[:user_id] = user.id
  	end

  	# Returns the current logged-in user (if any).
  def resume_current_user
    @resume_current_user ||= Resume.find_by(id: session[:user_id])
  end

  def status_logged_in?
    !resume_current_user.nil?
  end

  def status_log_out
    session.delete(:user_id)
    @resume_current_user = nil
  end
end
