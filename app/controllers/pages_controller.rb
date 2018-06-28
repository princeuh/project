class PagesController < ApplicationController
  before_action :logout_users , only: [:home, :about, :team, :terms, :privacy, :careers, :contact, :enterprises, :ventures]
  before_action :logout_employees , only: [:home, :about, :team, :terms, :privacy, :careers, :contact, :enterprises, :ventures]
  before_action :logout_beneficiaries , only: [:home, :about, :team, :terms, :privacy, :careers, :contact, :enterprises, :ventures]
  before_action :logged_in_employee, only: [:new, :create, :edit, :update, :destroy]

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
    @highlight = Page.new(highlight_params)
    if @highlight.save
      #save and log in the highlight
      flash[:success] = "Successfully added a highlight"
      SystemLog.new( system_event: "#{current_employee.lastname}, #{current_employee.firstname}, #{current_employee.email} created a highlight for the home page #{@highlight.caption}", event_time: Time.now, users_id: current_employee.id).save
      redirect_to current_employee
    else
      flash[:error] = "Error in data. Unable to save highlight."
      redirect_to current_employee
    end
  end

  def edit
    @highlight = Page.find(highlight_params)
  end

  def update
    @highlight = Page.find(params[:id])
    if @highlight.update(highlight_params)
       SystemLog.new( system_event: "#{current_employee.lastname}, #{current_employee.firstname}, #{current_employee.email} updated a highlight on the home page #{@highlight.caption}", event_time: Time.now,  users_id: current_employee.id).save
      redirect_to current_employee
    else
      flash[:error] = "Unable to update"
    end
  end

  def destroy
    @highlight = Page.find(params[:id])
     SystemLog.new( system_event: "#{current_employee.lastname}, #{current_employee.firstname}, #{current_employee.email} deleted a highlight from the system #{@highlight.caption}", event_time: Time.now,  users_id: current_employee.id).save
    @highlight.destroy

    redirect_to current_employee
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

  def logout_employees
    if employee_logged_in?
      employee_logout
      redirect_to root_url
    end
  end

  def logout_beneficiaries
    if beneficiary_logged_in?
      beneficiary_log_out
       redirect_to root_url
    end
  end

    def logged_in_employee
      unless employee_logged_in?
        flash[:danger] = "Please log in."
        redirect_to employee_account_url
      end
    end
end
