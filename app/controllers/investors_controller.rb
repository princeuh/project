class InvestorsController < ApplicationController
  def new
  	@investor = Investor.new
  end
end
