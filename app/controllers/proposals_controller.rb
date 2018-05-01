class ProposalsController < ApplicationController
		#employees to view all proposals in order of submission

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
			redirect_to current_user
		else
			render 'new'
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

end
