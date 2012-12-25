class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  USERNAME_GUEST = "Guest"

  validates :username, :presence => {:on => :create},
            :length => { :minimum => 3, :maximum => 255 }

	state_machine :state, :initial => :pending do

		event :activate do
			transition :pending => :active
		end

	end
end
