class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :restaurant_id
      t.string  :uuid
      t.integer :number
      t.timestamps
    end
  end
end
