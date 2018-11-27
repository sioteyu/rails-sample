class PostsController < ApplicationController
	def create
		@post = current_user.post.build(post_params)
		if @post.save
			flash[:success] = "Created a new post"
			redirect_to '/profile'
		else
			flash[:danger] = "Oops something went wrong"
			redirect_to '/profile'
		end

	end

	private
		def post_params
			params.require(:post).permit(:content)
		end
end
