# Comment model, associates each comment with a user and post
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
end
