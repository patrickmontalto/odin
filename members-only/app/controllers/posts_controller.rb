class PostsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create]
	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create 
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			flash[:success] = "Post created."
			redirect_to posts_path
		else
			flash[:danger] = "Problem with post."
			render 'new'
		end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

		def signed_in_user
			unless signed_in?
				redirect_to login_url
			end
		end

		def post_params
			params.require(:post).permit(:title, :about, :body, :user_id)
		end
end
