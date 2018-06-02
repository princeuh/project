class ProposalsController < ApplicationController
		#employees to view all proposals in order of submission
	before_action :logged_in_user, only: [:edit, :update]
	before_action :correct_user

	def index
		@proposals = Proposal.all
	end

	#only investors can create proposals
	def new
		@proposal = Proposal.new
	end

	#show a proposal
	def show
		@investor = Investor.find(params[:investor_id])
		@proposal = @investor.proposal.find(params[:id])
	end

	def create
		@investor = Investor.find(params[:investor_id])
		@proposal = @investor.proposals.create(proposal_params)
		if @proposal.save
			#redirect to the proposal show page
			flash[:success] = "Your proposal has been successfully submitted. View the status of all Proposals by clicking the Proposal Tab."
			redirect_to current_user
		else
			render current_user
		end
	end

	#only investors can remove/destroy their proposals if it hasn't been accepted yet
	def destroy
		@investor = Investor.find(params[:investor_id])
		@investor = @investor.proposals.find(params[:id])
		@investor.destroy
		redirect_to current_user
	end

	private
	def proposal_params
		params.require(:proposal).permit(:title, :content, :country, :target_amt)
	end

	def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

	def correct_user
      @user = Investor.find(params[:investor_id])
      redirect_to(root_url) unless @user == current_user
    end

end
