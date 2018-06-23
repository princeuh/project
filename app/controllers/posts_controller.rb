class PostsController < ApplicationController
	before_action :logged_in_employee, only: [:new, :create, :edit, :update, :destroy, :show]
	#view all posts to be used as the app's blog on the social media tools
	def index
		@posts = Post.all
	end

	#appropriate employees create a new post
	def new
		@post = Post.new
	end

	#the new post is saved
	def create
		@post = Career.new(post_params)
		@post.is_approved = false
  		if @post.save
  		#saved and logged in employee
      		SystemLog.new( system_event: "Blog Post #{@post.title} created by #{current_employee.lastname}, #{current_employee.firstname}.", event_time: Time.now).save
      		redirect_to @post
  		else
  			render 'new'
  		end
	end

	def show
		@post = Post.find(params[:post_id])
	end

	#appropriate employees can edit a post
	def edit
		@post = Post.find(params[:post_id])
	end

	#appropriate employees can update a post
	def update
		@post = Post.find(params[:id])
		if @post.update(club_params)
			SystemLog.new( system_event: "Blog Post #{@post.title} updated by #{current_employee.lastname}, #{current_employee.firstname}.", event_time: Time.now).save
			redirect_to @post
		else
			render 'edit'
		end
	end

	#appropriate employees can destroy a post
	def destroy
		@post = Post.find(params[:id])
		SystemLog.new( system_event: "Blog Post #{@post.title} deleted from system by #{current_employee.lastname}, #{current_employee.firstname}.", event_time: Time.now).save
		@post.destroy
		redirect_to posts_path
	end

	#post parameters are sent through strong params
	private
		def post_params
			params.require(:post).permit(:title, :content, :picture)
		end

		def logged_in_employee
      		unless employee_logged_in?
        	flash[:danger] = "Please log in."
        	redirect_to employee_account_url
      		end
    	end



end
