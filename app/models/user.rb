class User < ActiveRecord::Base
	has_many :posts
	has_many :comments
	has_many :votes
	
	has_secure_password validation: false
 	validates :username, presence: true, length: {minimum: 5}
	validates :password, presence: true, on: :create, length: {minimum: 5}
 end

