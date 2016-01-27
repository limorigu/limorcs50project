# Vote model (like/dislke), associates each vote with a user and a post
class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
end
