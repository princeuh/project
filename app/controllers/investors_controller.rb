class InvestorsController < ApplicationController
  def new
  	@investor = Investor.new
  end

  def show
  	@investor = Investor.find(params[:id])
  end

  def create
  	@investor = Investor.new(investor_params)
  	if @investor.save
  		#handle successful save
      log_in @investor
      flash[:success] = "Welcome to your Nemabollon Account"
      redirect_to @investor
  	else 
  		render 'new'
  	end
  end

  private
	def investor_params
		params.require(:investor).permit(:firstname, :lastname, :email, :password,
                                   :password_confirmation)
	end
end
