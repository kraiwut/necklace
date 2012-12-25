class Message < ActiveRecord::Base
  attr_accessible :body, :sender_id, :state, :subject
end
