class AccountActivationsController < ApplicationController
	def edit_investor
    	user = Investor.find_by(email: params[:email])
    	if user && !user.activated? && user.authenticated?(:activation, params[:id])
          user.activate
      		log_in user
      		flash[:success] = "Account activated!"
      		redirect_to user
    	else
      		flash[:danger] = "Invalid activation link"
      		redirect_to root_url
    	end
  	end


    def edit_beneficiary
      user = Beneficiary.find_by(email: params[:email])
      if user && !user.activated? && user.authenticated?(:activation, params[:id])
          user.activate
          beneficiary_log_in user
          flash[:success] = "Account activated!"
          redirect_to user
      else
          flash[:danger] = "Invalid activation link"
          redirect_to root_url
      end
    end
end
