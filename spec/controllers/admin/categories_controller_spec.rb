require 'spec_helper'

describe Admin::CategoriesController do
	let(:admin) 				{ SiteAdmin.make! }
	let(:home_category)	{ init_home_category }

	before :each do
		sign_in admin
	end

	it "should not allow normal user to manage category" do
		sign_out admin
		sign_in User.make!
		get "new"
		response.should redirect_to(root_path)
	end

	describe "#new category" do
		it "should be able to create subcategory" do
			parent = home_category.children[1]
			get "new", :parent_id => parent.id
			assigns[:parent_category].should == parent
			assigns[:category].parent_id.should == parent.id
		end

		it "should have parent category" do
			home_category
			get "new"
			assigns[:parent_category].should_not be_nil
		end
	end

	describe "#create" do

		it "should return error if name is blank" do
			get "create", :category => { :name => "", :parent_id => Category.make! }
			flash[:alert].should match(/^Could not create a new category!/)
		end

		it "should create a new category" do
			category = Category.make
			parent = Category.make!
			_before = Category.count
			get "create", :category => { :name => category.name,
																	 :parent_id => parent.id }
			Category.count.should == _before + 1
		end

	end

	describe "edit" do
		it "should be able to edit category" do
			get "edit", :id => Category.make!.id
			assigns[:category].should_not be_nil
		end
	end

	describe "#destroy" do
		it "should be able to destroy category" do
      pending "Please fix this :)"
			home_category
			_before = Category.count
			category = home_category.children[1]
			get "destroy", :id => home_category.children[1].id
			Category.count.should == _before - 6 # 1 category + 5 sub-categories
			flash[:notice].should == "Deleted #{category.name}"
			expect { category.reload }.to raise_error
		end

		it "should not available to delete home category" do
			home_category
			_before = Category.count
			get "destroy", :id => home_category.id
			flash[:error].should == "Could not delete 'Home' category"
			Category.count.should == _before
		end
	end

end
