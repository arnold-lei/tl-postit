class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :post_categories
	has_many :categories, through: :post_categories
	has_many :votes, as: :voteable 

	validates :title, presence: true, length: {minimum: 5}
	validates :url, presence: true, uniqueness: true
	validates :description, presence: true

	def vote_total
		upvotes - downvotes
	end

	def upvotes
		self.votes.where(vote: true).size
	end

	def downvotes
		self.votes.where(vote: false).size
	end
end