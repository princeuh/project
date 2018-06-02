class PostsController < ApplicationController
	#view all posts
	def index
		@posts = Post.all
	end

	#appropriate employees create a new post
	def new
	end

	#the new post is saved
	def create
	end

	#appropriate employees can edit a post
	def edit
	end

	#appropriate employees can update a post
	def update
	end

	#appropriate employees can destroy a post
	def destroy
	end

	#post parameters are sent through strong params
	private
		def post_params
			params.require(:post).permit(:title, :content, :picture)
		end



end
