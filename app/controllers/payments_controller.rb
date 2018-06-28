class PaymentsController < ApplicationController
  require "stripe"


  def check_out
  	#Stripe.api_key = "sk_test_ErANBi8jGcyUrgaJnNQkzWYR"
  	# Token is created using Checkout or Elements!
	# Get the payment token ID submitted by the form:
	token = params[:stripeToken]
	@option = params[:checkout][:charge_type]
	@charged = params[:checkout][:charge_amt]
	@club_joined = params[:checkout][:club_joined]

	

	#we are creating a new customer for subscriptions
	if current_user.cust_id == 0
		customer = Stripe::Customer.create({
				:description => "Nemabollon Investor Charges",
				:email => current_user.email, 
				:source => token,
			})
		current_user.update_attribute(:stripe_cust_id, customer.id)
	end




	if @option == 'monthly-fee' && @charged == '1'	
		Stripe::Subscription.create({
				:customer => current_user.stripe_cust_id,
				:items => [
					{ :plan => 'plan_D0Xfo5ytIdv5AI',
					},
				]	
						#:plan => 'plan_Cur8EF2z9uZ4Qs',}]	 
		})
		@description = 'Nemabollon Investment'
		SystemLog.new( system_event: " #{current_user.email} service fee subscription created.", event_time: Time.now, users_id: current_user.id).save

	elsif  @option == 'investment' 
		Stripe::Subscription.create({
				:customer => current_user.stripe_cust_id,
				:items => [{
						:plan => assign_plan,
				}]	 
		})
		@description = 'Nemabollon Investment'
		#write the new record to the database
		if find_investor?
			@update_amt = Club.find_by(id: @club_joined)
			@update_amt.amt_invested += @charged.to_i
			@update_amt.update_attribute(:amt_invested, @update_amt.amt_invested)
			@update_member_amt = ClubMember.find_by(investor_id: current_user.id)
			@update_member_amt.amount_invested += @charged.to_i
			@update_member_amt.update_attribute(:amount_invested, @update_member_amt.amount_invested)
			SystemLog.new( system_event: " #{current_user.email} investment subscription has been updated for $ #{assign_plan} plan.", event_time: Time.now, users_id: current_user.id).save
			flash[:success] = "Your investment is successful. View your updates under the myClubs tab."
		else
			ClubMember.new(investor_id: current_user.id, club_id: @club_joined, amount_invested: @charged ).save
			@update_amt = Club.find_by(id: @club_joined)
			@update_amt.amt_invested += @charged.to_i
			@update_amt.number_of_members += 1
			@update_amt.update_attribute(:amt_invested, @update_amt.amt_invested)
			@update_amt.update_attribute(:number_of_members, @update_amt.number_of_members)
			SystemLog.new( system_event: " #{current_user.email} investment subscription created for $ #{assign_plan}.", event_time: Time.now, users_id: current_user.id).save
			flash[:success] = "Your investment is successful. View your clubs under the myClubs tab."
		end
		
	else 
		flash[:error] = "Invalid charge. Please try again or contact your system admin."
	end

	current_user.update_attribute(:paid, true)	
	SystemLog.new( system_event: " #{current_user.email} has activated monthly service fee and is now able to access the platform.", event_time: Time.now, users_id: current_user.id).save
	redirect_to current_user


	rescue Stripe::CardError => e
  		flash[:error] = e.message
  		redirect_to current_user
  end



  private 
  	def assign_plan
  			if @charged == "25"
				@plan = 'plan_CurFB7ArT1fHoe'
			elsif @charged == "50"
				@plan = 'plan_CurGCV7Kq9rKOJ'
			elsif @charged == "100"
				@plan = 'plan_CurHiGJ7uttcAd'
			elsif @charged == "500"
				@plan = 'plan_CurHwQapUFjgoC'
			elsif  @charged == "1000"
				@plan = 'plan_CurI9tm0bGfBtB'
			elsif  @charged == "5000"
				@plan = 'plan_CurJCnjEEc7RR0'
			elsif  @charged == "10000"
				@plan = 'plan_CurKVlm1vJRe9w'
			elsif  @charged == "25000"
				@plan = 'plan_CurLMVE5OPdYkk'
			elsif  @charged == "50000"
				@plan = 'plan_CurMDazgHofv9U'
			elsif  @charged == "100000"
				@plan = 'plan_CurME7P1gA7swr'
			elsif @charged == "500000"
				@plan = 'plan_CurNlautns8X2f'
			else 
				@plan = "invalid"
			end	


			#if @charged == "25"
			#	@plan = 'plan_D0qh1A0GWq0TYC'
			#elsif @charged == "50"
			#	@plan = 'plan_D0qh1A0GWq0TYC'
			#elsif @charged == "100"
			#	@plan = 'plan_D0qh1A0GWq0TYC'
			#elsif @charged == "500"
			#	@plan = 'plan_D0qh1A0GWq0TYC'
			#elsif  @charged == "1000"
			#	@plan = 'plan_D0qh1A0GWq0TYC'
			#elsif  @charged == "5000"
			#	@plan = 'plan_D0qh1A0GWq0TYC'
			#elsif  @charged == "10000"
			#	@plan = 'plan_D0qh1A0GWq0TYC'
			#elsif  @charged == "25000"
			#	@plan = 'plan_D0qh1A0GWq0TYC'
			#elsif  @charged == "50000"
			#	@plan = 'plan_D0qh1A0GWq0TYC'
			#elsif  @charged == "100000"
			#	@plan = 'plan_D0qh1A0GWq0TYC'
			#elsif @charged == "500000"
			#	@plan = 'plan_D0qh1A0GWq0TYC'
			#else 
			#	@plan = "invalid"
			#end	

  	end
end

