class ContactsController < ApplicationController
	before_action :logged_in_employee, only: [:index, :show, :destroy]	
	def index
		@contacts = Contact.all
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.save
			SystemLog.new( system_event: " Inquiry Submitted from Contact Form", event_time: Time.now).save
			flash[:success] = "Your inquiry has been submitted. Someone will be in touch soon."
			redirect_to root_url
		else 
			flash[:error] = "Unable to send your Inquiry. Please try again."
		end
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy

		redirect_to contacts_path
	end

	private
	 def contact_params
	 	params.require(:contact).permit(:firstname, :lastname, :email, :subject, :inquiry)
	 end

	private
	  def logged_in_employee
        unless employee_logged_in?
          flash[:danger] = "Please log in."
          redirect_to employee_account_url
        end
      end
end
