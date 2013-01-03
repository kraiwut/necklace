class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :name
      t.string :file
      t.integer :product_id

      t.timestamps
    end
  end
end
