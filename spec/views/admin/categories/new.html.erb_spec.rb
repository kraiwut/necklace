# require 'spec_helper'

# describe "admin/categories/new" do
# 	let(:admin) 				{ SiteAdmin.make! }
# 	let(:home_category) { init_home_category }

# 	it "should be able to select parent category" do
# 		sign_in admin
# 		@parent_category = home_category
# 		@category = @parent_category.children.build
# 		@categories = Category.all

# 		render :template => "admin/categories/new"

# 		assert_select "select[id=category_parent_id] option", :count => 10
# 	end

# end
