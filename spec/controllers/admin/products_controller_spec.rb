require 'spec_helper'

describe Admin::ProductsController  do

	describe "index" do
	
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

		it "should retrieve all product in the category" do
			sign_in User.make!(:admin)
			get "index", :category_id => init_categories[1]
			assigns[:products].length.should == 5
		end

	end

end