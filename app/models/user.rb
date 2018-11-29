class User < ApplicationRecord
	has_many :post
	has_many :friend_request
	validates :username, presence: true
	validates :email, uniqueness: true
	has_secure_password
end
