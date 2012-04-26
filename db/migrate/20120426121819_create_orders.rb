class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :user_id
      t.integer :restaurant_id

      t.timestamps
    end
    
    create_table :dishes_orders, :id => false do |t|
      t.references  :order, :dish
    end
    add_index :dishes_orders, [:order_id, :dish_id]
  end
end
