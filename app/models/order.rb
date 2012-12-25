class Order < ActiveRecord::Base
  attr_accessible :state, :user_id
end
