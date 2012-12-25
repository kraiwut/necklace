module UsersHelper

	def render_current_user_name
		current_user ? current_user.username : "Guest"
	end

end