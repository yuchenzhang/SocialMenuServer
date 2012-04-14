class Ingredient < ActiveRecord::Base
  has_many :pictures, :class_name => "IngredientPicture"
  has_and_belongs_to_many :dishes
  
  def add_picture_from_file(file)
    pictures.create!(:photo => file)
  end

end
