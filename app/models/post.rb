class Post < ApplicationRecord

	validates :body, length: {minimum: 10}, format: {without: /\A\s+\z/,
    message:"can't be blank"}

    belongs_to :user
    has_many :comments

	def preview (letters: 40)
    	body.size > letters ? body[0...letters] + "..." : body
    end

end
