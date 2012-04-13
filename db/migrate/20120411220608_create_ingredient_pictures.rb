class CreateIngredientPictures < ActiveRecord::Migration
  def change
    create_table :ingredient_pictures do |t|
      t.integer :ingredient_id  
      t.string  :caption
      t.has_attached_file :photo
      t.timestamps
    end
  end
end
