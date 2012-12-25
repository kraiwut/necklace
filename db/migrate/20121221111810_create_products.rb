class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :seo_link
      t.float :price
      t.text :short_description
      t.text :description

      t.timestamps
    end
  end
end
