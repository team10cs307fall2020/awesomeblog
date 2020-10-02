class Topic < ApplicationRecord
  validates :title, presence: true,
           length: { maximum: 20}
  validates :desc, presence: true,
           length: {maximum: 140}

  scope :title, -> {}
end



#def aug
#  Post.find_by_sql("SELECT posts.title FROM posts INNER JOIN topics ON posts.topic = topics.title")
#end

#def fuc
#  Post.find_by_sql("SELECT topics.title FROM posts, topics WHERE posts.topic = topics.title")
#  Post.distinct.pluck(:title)
#end

#def fuc2
#  Post.find_by_sql("SELECT posts.text FROM posts INNER JOIN topics ON posts.topic = topics.title")
#  Post.distinct.pluck(:desc)
#end
#Topic.find_by_sql"SELECT topic FROM posts, topics WHERE posts.topic = topics.title"

#<% fuc.each do |fuc| %>
#  <tr>
#<th>
#    <%= fuc %> <br>
#    </th>
#  </tr>
#<% end %>
