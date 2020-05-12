class Comment < ApplicationRecord
	 belongs_to :user
	 belongs_to :post
	 validates :body, length: {in: 1..255}, format: {without: /\A\s+\z/,
    message:"can't be blank"}
end
