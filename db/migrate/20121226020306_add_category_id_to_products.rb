class AddCategoryIdToProducts < ActiveRecord::Migration
  def change
  	add_column :products, :category_id, :integer

  	category = Category.create(:name => "Home")
  	Product.update_all(:category_id => category.id)
  end
end
