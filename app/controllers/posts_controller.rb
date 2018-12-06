class PostsController < ApplicationController
	def create
		@post = current_user.post.build(post_params)
		@post.save
		respond_to do |format|
			format.js {
				render
			}
		end
	end

	private
		def post_params
			params.require(:post).permit(:content)
		end
end
