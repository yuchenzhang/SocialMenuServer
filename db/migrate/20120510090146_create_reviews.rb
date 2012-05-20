class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :dish_id
      t.integer :order_id
      t.text :comment
      t.has_attached_file :picture  
      t.timestamps
    end
  end
end
