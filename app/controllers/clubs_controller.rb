class ClubsController < ApplicationController
	def index
		@clubs = Club.all
	end

	def new
		@club = Club.new
	end

	def create
		@club = Club.new(club_params)
		if @club.save
			redirect_to @club
		else
			render 'new'
		end
	end

	def show
		@club = Club.find(params[:id])
	end

	def edit
		@club = Club.find(params[:id])
	end

	def update
		@club = Club.find(params[:id])
		if @club.update(club_params)
			redirect_to @club
		else
			render 'edit'
		end
	end

	def destroy
		@club = Club.find(params[:id])
		@club.destroy

		redirect_to clubs_path
	end

	private
	def club_params
		params.require(:club).permit(:name, :focus_country, :country_manager, :fund_target, :amt_invested, :number_of_members, :proposal)
	end
end
