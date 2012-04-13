class Dish < ActiveRecord::Base
  belongs_to :restaurant
  has_many :pictures, :class_name => "DishPicture"
  
  def add_picture_from_file(file)
    pictures.create!(:photo => file)
  end
end
