require 'spec_helper'

describe UsersHelper do
	
	describe "#render_current_user_name" do

		it "should be able to display username of current user" do
			user = User.make!
			sign_in user
			helper.render_current_user_name.should == user.username
		end

		describe "unauthorize user" do
			it "should be 'Guest'" do
				helper.render_current_user_name.should == User::USERNAME_GUEST
			end
		end

	end

end