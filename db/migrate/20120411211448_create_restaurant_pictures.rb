class CreateRestaurantPictures < ActiveRecord::Migration
  def change
    create_table :restaurant_pictures do |t|
      t.integer :restaurant_id
      t.string  :caption
      t.has_attached_file :picture
      t.timestamps
    end
  end
end
