module SessionsHelper
	def log_in(investor)
		session[:investor_id] = investor.id
	end

	# Remembers a user in a persistent session.
  def remember(investor)
    investor.remember
    cookies.permanent.signed[:investor_id] = investor.id
    cookies.permanent[:remember_token] = investor.remember_token
  end

	def current_user
		if (user_id = session[:investor_id])
      		@current_user ||= Investor.find_by(id: user_id)
    	elsif (user_id = cookies.signed[:investor_id])
      		user = Investor.find_by(id: user_id)
      		if user && user.authenticated?(:remember, cookies[:remember_token])
        		log_in user
        		@current_user = user
      		end
   		end
	end


	#returns true if the user is logged in, false otherwise
	def logged_in?
		!current_user.nil?
	end


	# Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:investor_id)
    cookies.delete(:remember_token)
  end

	#logs out the current user
	def log_out
		forget(current_user)
		session.delete(:investor_id)
		@current_user = nil
	end

end
