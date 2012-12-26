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

	def edit
		@product = get_product
	end

	def  update
		@product = get_product
		if @product.update_attributes(params[:product])
			redirect_to admin_products_path
		else
			render 'edit'
		end
	end

	def destroy
		product = get_product.destroy
		flash[:notice] = "Deleted #{product.name}"
		redirect_to admin_products_path
	end

	private
		def get_product
			Product.find(params[:id])
		end

end