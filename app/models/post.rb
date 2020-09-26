class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :topic, presence: { message: "topic cannot be empty" },
            length: {maximum: 100}
  validates :title, presence: { message: "title cannot be empty" },
            length: {maximum: 100}
  validates :text, presence: { message: "text cannot be empty" },
            length: {maximum: 200}
  #validates :anonymous, ...
  # belongs_to :user
  # belongs_to :topic
end
