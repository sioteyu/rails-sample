class User < ApplicationRecord
	has_many :post
	validates :username, presence: true
	has_secure_password
end
