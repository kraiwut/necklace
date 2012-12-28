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

	describe "#create" do

		it "should create a new product" do
			home_category
			_before = Product.count
			get "create", :category_id => home_category, 
										:product => { :name => "Prod",
																	:description => "Desc prod",
																	:price => 1000 }
			Product.count.should == _before + 1
		end

		it "should redirect to category screen" do
			get "create", :category_id => home_category, 
										:product => { :name => "Prod",
																	:description => "Desc prod",
																	:price => 1000 }
			response.should redirect_to admin_category_products_path(home_category)
		end

		it "should return error if name is blank" do
			get "create", :category_id => home_category, 
										:product => { :name => "",
																	:description => "Desc prod",
																	:price => 1000 }
			flash[:alert].should match(/^Could not create a new product!/)
			response.should render_template "new"
		end

		it "should return error if price is blank" do
			get "create", :category_id => home_category, 
										:product => { :name => "Prod",
																	:description => "Desc prod",
																	:price => "" }
			flash[:alert].should match(/^Could not create a new product!/)
			response.should render_template "new"
		end

	end

	describe "#edit" do
		it "should be able to edit" do
			category = home_category.children.first
			get "edit", :category_id => category, :id => category.products.first
			response.should render_template("edit")
		end
	end

	describe "#destroy" do
		it "should be able to destroy product" do
			category = home_category.children.first
			_before = Product.count
			get "destroy", :category_id => category, :id => category.products.first
			Product.count.should == _before - 1
		end
	end

end