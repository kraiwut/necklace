require 'spec_helper'

describe Admin::ProductsController  do
	let(:admin) 					{ User.make! :admin }
	let!(:home_category)	{ init_home_category }

	before :each do
		sign_in admin
	end

	describe "index" do
		before :each do
			init_home_category
		end
	
		it "should not allow normal user" do
			sign_out admin
			sign_in User.make!
			get "index", :category_id => Category.make!
			response.should redirect_to root_path
		end

		it "should allow admin" do
			get "index", :category_id => Category.make!
			response.should render_template "index"
		end

		it "should retrieve all product in the category" do
			get "index", :category_id => home_category.children[1]
			assigns[:products].length.should == 5
		end

		describe "admin root path" do
			it "should go to 'Home' category screen" do
				get "index"
				assigns[:category].name.should == "Home"
				assigns[:category].parent_id.should be_nil
			end
		end

	end

	describe "#new product" do

		it "should belongs to the category" do
			get 'new', :category_id => home_category
			assigns[:product].category.should == home_category
		end

	end

end