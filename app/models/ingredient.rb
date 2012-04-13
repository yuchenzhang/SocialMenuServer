class Ingredient < ActiveRecord::Base
  has_many :pictures, :class_name => "IngredientPicture"
  
  def add_picture_from_file(file)
    pictures.create!(:photo => file)
  end
end
