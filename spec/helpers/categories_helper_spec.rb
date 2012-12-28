require 'spec_helper'

describe CategoriesHelper do
	let(:home_category) { init_home_category }

	describe "#render_categories_tree" do
		it "should be able treeview" do
			home_category
			Nokogiri::HTML(helper.render_categories_tree)
				.css('li').length.should == Category.count
		end
	end

end