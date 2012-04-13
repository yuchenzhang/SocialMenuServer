class CreateDishPictures < ActiveRecord::Migration
  def change
    create_table :dish_pictures do |t|
      t.integer :dish_id
      t.string  :caption
      t.has_attached_file :photo
      t.timestamps
    end
  end
end
