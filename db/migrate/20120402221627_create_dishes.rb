class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :restaurant_id
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
