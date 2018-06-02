class PagesController < ApplicationController
  before_action :logout_users
  before_action :logout_beneficiaries

  def home
    @highlights = Page.all
  end

  def about
  end

  def team
  end

  def terms
  end

  def privacy
  end

  def careers
    @careers = Career.all
  end

  def contact
  end

  def enterprises
  end

  def ventures
  end

#accessible by employees with correct credentials
  def new 
    @highlight = Page.new
  end


  def create
    @highlights = Page.new(highlight_params)
    if @highlights.save
      #save and log in the highlight
      flash[:success] = "Successfully added a highlight"
      redirect_to root_url
    else
      flash[:error] = "Error in data. Unable to save highlight."
    end
  end

  def edit
    @highlight = Page.find(highlight_params)
  end

  def update
    @highlight = Page.find(params[:id])
    if @highlight.update(highlight_params)
      redirect_to root_url
    else
      flash[:error] = "Unable to update"
    end
  end

  def destroy
    @highlight = Page.find(params[:id])
    @highlight.destroy

    redirect_to root_url
  end

private 

  def highlight_params
    params.require(:page).permit(:caption, :summary, :picture)
  end

  def logout_users
    if logged_in?
      log_out
      redirect_to root_url
    end
  end

  def logout_beneficiaries
    if beneficiary_logged_in?
      beneficiary_log_out
    end
  end
end
