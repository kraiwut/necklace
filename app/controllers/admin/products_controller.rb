class Admin::ProductsController < AdminController

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(params[:product])
		if @product.save
			redirect_to admin_products_path
		else
			render "new"
		end
	end

end