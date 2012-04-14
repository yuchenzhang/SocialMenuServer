class Dish < ActiveRecord::Base
  belongs_to :restaurant
  has_many :pictures, :class_name => "DishPicture"
  has_and_belongs_to_many :ingredients, :join_table => "ingredients_dishes"
  
  def add_picture_from_file(file)
    pictures.create!(:photo => file)
  end
  
end
