class Ability
	include CanCan::Ability
	
	def initialize(user)
		unless user.nil?
			if user.is_a? SiteAdmin
				can :manage, :all
			end
		end

		can :read, :all
	end
end
