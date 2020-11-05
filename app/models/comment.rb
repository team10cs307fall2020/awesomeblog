class Comment < ApplicationRecord
  attr_accessor :commenter
  validates :body, presence: { message: "text cannot be empty" },
            length: {maximum: 200}
  belongs_to :post
end
