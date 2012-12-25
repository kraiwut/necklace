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

	def destroy
		product = Product.find(params[:id]).destroy
		flash[:notice] = "Deleted #{product.name}"
		redirect_to admin_root_path
	end

end