class ProductsController < ApplicationController

	def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
    else
      @category = Category.root
    end
		@products = @category.products
	end

end