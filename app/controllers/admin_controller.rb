class AdminController < ApplicationController
	before_filter :admin!

	def admin!
		flash[:alert] = "Please implement 'admin!' method!!"
	end

end