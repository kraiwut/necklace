class Admin::ProductsController < AdminController

	def index
		if params[:category_id]
			@category = get_category
		else
			@category = get_home_category
		end
		@products = @category.products
	end

	def new
		@category = get_category
		@product = @category.products.build
		@product.images.build
	end

	def create
		@category = get_category
		@product = @category.products.build(params[:product])
		if @product.save
			redirect_to admin_category_products_path(@category)
		else
			flash[:alert] = "Could not create a new product!\n#{record_invalid_error_message(@product)}"
			render "new"
		end
	end

	def edit
		@category = get_category
		@product = get_product
	end

	def update
		@category = get_category
		@product = get_product
		if @product.update_attributes(params[:product])
			redirect_to admin_category_products_path(@category)
		else
			flash[:alert] = "Could not edit product!\n#{record_invalid_error_message(@product)}"
			render 'edit'
		end
	end

	def destroy
		@category = get_category
		@product = get_product.destroy
		flash[:notice] = "Deleted #{@product.name}"
		redirect_to admin_category_products_path(@category)
	end

	private
		def get_product
			Product.find(params[:id])
		end

		def get_category
			Category.find(params[:category_id])
		end

		def get_home_category
			Category.where(:parent_id => nil).first
		end

end