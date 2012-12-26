class Admin::CategoriesController < AdminController

	def new
		@parent = Category.find(params[:parent_id])
		@category = @parent.children.build
	end

	def create
		@category = Category.new(params[:category])
		if @category.save
			redirect_to admin_category_products_path(@category)
		else
			render "new"
		end
	end

	def edit
		@category = Category.find(params[:id])
	end

	def destroy
		@category = Category.find(params[:id])
		if @category.parent
			@category.destroy
			flash[:notice] = "Deleted #{@category.name}"
		else
			flash[:error] = "Could not delete root folder"
		end
		redirect_to admin_category_products_path(@category.parent_id)
	end

end