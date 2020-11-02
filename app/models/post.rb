class Post < ApplicationRecord
  belongs_to :user
  # belongs_to :topic
  has_many :comments, dependent: :destroy
  validates :topic, presence: { message: "topic cannot be empty" },
            length: {maximum: 100}
  validates :title, presence: { message: "title cannot be empty" },
            length: {maximum: 100}
  validates :text, presence: { message: "text cannot be empty" },
            length: {maximum: 200}
  attr_accessor :anonymous
  validates :vote
  #validates :anonymous, ...
  # belongs_to :user
  # belongs_to :topic
end



#def aug
#  Post.find_by_sql("SELECT posts.title FROM posts INNER JOIN topics ON posts.topic = topics.title")
#end

#def fuc1
  # Post.find_by_sql("SELECT posts.title FROM posts INNER JOIN topics ON posts.topic = topics.title")
  # # Post.distinct.pluck(:topic)
#end

#def fuc2
# Post.find_by_sql("SELECT posts.text FROM posts INNER JOIN topics ON posts.topic = topics.title")
# Post.distinct.pluck(:text)
#end

#<p>
#<%= Post.find_by_sql("SELECT posts.topic FROM posts INNER JOIN topics ON posts.topic = topics.title") %>
#</p>
