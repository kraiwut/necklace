require 'spec_helper'

describe Admin::ProductsController  do
	
	it "should not allow normal user" do
		sign_in User.make!
		get "index", :category_id => Category.make!
		response.should redirect_to root_path
	end

	it "should allow admin" do
		sign_in User.make!(:admin)
		get "index", :category_id => Category.make!
		response.should render_template "index"
	end

end