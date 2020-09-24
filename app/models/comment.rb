class Comment < ApplicationRecord
  validates :commenter, presence: true
  validates :body, presence: { message: "text cannot be empty" },
            length: {maximum: 200}
  belongs_to :post
end
