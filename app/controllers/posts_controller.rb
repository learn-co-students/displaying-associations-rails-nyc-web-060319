class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
		@categories = Category.all
	end

	def post_params(params)
		params.require(:post).permit(:title,:description)
	end
	def create
		post = Post.create(post_params(params))
		redirect_to post_path(post)
	end

	def edit
		@post = Post.find(params[:id])
		@categories = Category.all
	end

	def update
		post = Post.find(params[:id])
		post.update(post_params(params))
		redirect_to post_path(post)
	end
end
