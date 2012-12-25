class Comment < ActiveRecord::Base
  attr_accessible :body, :commentable_id, :commentable_type, :user_id
end
