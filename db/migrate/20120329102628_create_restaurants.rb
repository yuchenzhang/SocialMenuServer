class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :uuid
      t.decimal :latitude,  :precision => 15, :scale => 10
      t.decimal :longitude, :precision => 15, :scale => 10
      t.integer :city_id
      t.string :address_line_1
      t.string :address_line_2

      t.timestamps
    end
  end
end
