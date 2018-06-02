class PaymentsController < ApplicationController
  def check_out
  	Stripe.api_key = "pk_test_FPhseII9qABn0XiQKaXv2HLb"
  	# Token is created using Checkout or Elements!
	# Get the payment token ID submitted by the form:
	token = params[:stripeToken]
	@option = params[:checkout][:charge_type]
	@charged = params[:checkout][:charge_amt]
	

	#we are creating a new customer for subscriptions
	if current_user.cust_id == 0
		customer = Stripe::Customer.create({
				:description => "Nemabollon Investor Charges",
				:email => current_user.email, 
				:source => token,
			})
		current_user.update_attribute(:cust_id, customer.id)
	end

	if @option == 'monthly-fee' && charged == '1'	
		current_user.update_attribute(:paid, true)

	elsif  @option == 'investment' 
		Stripe::Subscription.create({
				:customer => current_user.cust_id,
				:items => [{
						:plan => assign_plan,
				}]	 
		})
		@description = 'Nemabollon Investment'
		flash[:success] = "Your investment is successful. View your clubs under the myClubs tab."
	else 
		flash[:error] = "Invalid charge. Please try again or contact your system admin."
	end
		
	redirect_to current_user
  end



  private 
  	def assign_plan
  			if @charged == "25"
				@plan = 'prod_CurEjULpsVlAGJ'
			elsif @charged == "50"
				@plan = 'prod_CurFavARHDiASA'
			elsif @charged == "100"
				@plan = 'prod_CurG6HGmvxaj3T'
			elsif @charged == "500"
				@plan = 'prod_CurHCkVWip960A'
			elsif  @charged == "1000"
				@plan = 'prod_CurIAROXdKuK5k'
			elsif  @charged == "5000"
				@plan = 'prod_CurILqlnH8OsVz'
			elsif  @charged == "10000"
				@plan = 'prod_CurJHYCNc0lJ4W'
			elsif  @charged == "25000"
				@plan = 'prod_CurK9URan2gjMK'
			elsif  @charged == "50000"
				@plan = 'prod_CurLThwIJtFjIk'
			elsif  @charged == "100000"
				@plan = 'prod_CurMhWxc90dQ8u'
			elsif @charged == "500000"
				@plan = 'prod_CurN2nEaSlCOkM'
			else 
				@plan = "invalid"
			end	
  	end
end

