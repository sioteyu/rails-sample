class FriendsController < ApplicationController
	def index
		@friends = User.find_by_sql('SELECT * FROM users INNER JOIN friends ON users.id = friends.user_1 OR users.id = friends.user_2')
	end
end
