class AdminController < ApplicationController
	before_filter :admin!

	def admin!
		if !current_user || !current_user.is_a?(SiteAdmin)
			redirect_to root_path
		end
	end

end