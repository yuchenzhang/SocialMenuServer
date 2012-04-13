class AddTypeToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :type, :string
  end
end
