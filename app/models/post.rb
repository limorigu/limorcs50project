#Post model, associates each post with a user, and specifies that each post can have many comments and likes/dislikes
class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes
 end