class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :city
      t.string :province
      t.integer :country_code
      t.string :postal_code
      t.string :tel

      t.timestamps
    end
  end
end
