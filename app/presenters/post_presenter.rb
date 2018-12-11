class PostPresenter < BasePresenter
	def created_at
		h.time_ago_in_words(@model.created_at)
	end

	def content
		@model.content
	end
end
