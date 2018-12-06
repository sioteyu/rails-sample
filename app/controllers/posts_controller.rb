class PostsController < ApplicationController
	def create
		@post = current_user.post.build(post_params)
		@post.save
		respond_to do |format|
			format.json{
				render json: {
					post: render_to_string(
						partial:'user/post',
						layout: false,
						formats: :html,
						locals: {post:@post}
					)
				}
			}
		end
	end

	private
		def post_params
			params.require(:post).permit(:content)
		end
end
