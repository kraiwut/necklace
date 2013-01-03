require 'spec_helper'

describe ProductsHelper do
	let(:home_category) { init_home_category }
	let(:admin)					{ SiteAdmin.make! }
	let(:product)				{ Product.make! }

	it "should be able to display cover" do
		product = Product.make!
		product.images << Image.make!
		helper.display_cover(product).should match(/#{product.images.first.file}/)
	end

	it "should display no-image.jpg if product has no cover" do
		product = Product.make!
		helper.display_cover(product).should match(/no-image\.jpg/)
	end
end