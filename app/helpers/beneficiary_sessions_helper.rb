module BeneficiarySessionsHelper
	def beneficiary_log_in(beneficiary)
		session[:beneficiary_id] = beneficiary.id
	end

	# Remembers a user in a persistent session.
  def remember(beneficiary)
    beneficiary.remember
    cookies.permanent.signed[:beneficiary_id] = beneficiary.id
    cookies.permanent[:remember_token] = beneficiary.remember_token
  end

	def beneficiary_current_user
		if (user_id = session[:beneficiary_id])
      		@current_user ||= Beneficiary.find_by(id: user_id)
    	elsif (user_id = cookies.signed[:beneficiary_id])
      		user = Beneficiary.find_by(id: user_id)
      		if user && user.authenticated?(:remember, cookies[:remember_token])
        		log_in user
        		@current_user = user
      		end
   		end
	end


	#returns true if the user is logged in, false otherwise
	def beneficiary_logged_in?
		!beneficiary_current_user.nil?
	end


	# Forgets a persistent session.
  def forget_b(user)
    user.forget_beneficiary
    cookies.delete(:beneficiary_id)
    cookies.delete(:remember_token)
  end

	#logs out the current user
	def beneficiary_log_out
		forget_b(beneficiary_current_user)
		session.delete(:beneficiary_id)
		@current_user = nil
	end
end
