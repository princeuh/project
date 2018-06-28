class InvestorsController < ApplicationController
  before_action :logged_in_investor, only: [:show, :edit, :update]
  def new
  	@investor = Investor.new
  end

  def show
  	@investor = Investor.find(params[:id])
    @clubs = Club.all
    @membership = ClubMember.new
    @joined = ClubMember.where(investor_id: current_user.id)
    @club_updates = ClubUpdate.all
  end


  def create
  	@investor = Investor.new(investor_params)
    @investor.cust_id = 0
    @investor.paid = false
  	if @investor.save
  		#handle successful save
      log_in @investor
      @investor.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      SystemLog.new( system_event: "Investor #{@investor.lastname}, #{@investor.firstname},  #{@investor.email} account has been created.", event_time: Time.now, users_id: current_user.id).save
      redirect_to @investor
  	else 
  		render 'new'
  	end
  end

  def destroy
    @investor = Investor.find(params[:id])
    SystemLog.new( system_event: "Investor account destroyed for #{@investor.lastname},  #{@investor.firstname},  #{@investor.email} by #{current_employee.lastname},  #{current_employee.firstname},  #{current_employee.email} .", event_time: Time.now, users_id: current_user.id).save
    @investor.destroy
    redirect_to current_employee
  end

  private
	def investor_params
		params.require(:investor).permit(:firstname, :lastname, :email, :password,
                                   :password_confirmation, :investment_total)
	end

 
  def logged_in_investor
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end
end
