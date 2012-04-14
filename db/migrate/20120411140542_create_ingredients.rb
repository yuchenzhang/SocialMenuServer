class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
              t.string :name
        
              t.timestamps
            end 
    
    create_table :ingredients_dishes, :id => false do |t|
      t.references :ingredient,:dish
    end
    add_index :ingredients_dishes, [:ingredient_id, :dish_id]
  end
end
