class Admin::CategoriesController < AdminController

	def new
		if params[:parent_id]
			@parent_category = Category.find(params[:parent_id])
		else
			@parent_category = Category.root
		end
		@category = @parent_category.children.build
		@categories = Category.all
	end

	def create
		@category = Category.new(params[:category])
		if @category.save
			redirect_to admin_category_products_path(@category)
		else
			flash[:alert] = "Could not create a new category!\n#{record_invalid_error_message(@category)}"
			render "new"
		end
	end

	def edit
		@category = get_category
	end

	def destroy
		@category = get_category
		if @category.parent
			parent_id = @category.parent.id
			@category.destroy
			flash[:notice] = "Deleted #{@category.name}"
		else
			parent_id = @category.id
			flash[:error] = "Could not delete 'Home' category"
		end
		redirect_to admin_category_products_path(parent_id)
	end

	def update
		@category = get_category
		unless @category.update_attributes(params[:category])
			flash[:alert] = "Could not edit category!\n#{record_invalid_error_message(@category)}"
		end
		redirect_to admin_category_products_path(@category)
	end

	private
		def get_category
			Category.find(params[:id])
		end

end