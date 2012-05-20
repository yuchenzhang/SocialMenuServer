class Dish < ActiveRecord::Base
  belongs_to :restaurant                          
  has_many :reviews
  has_and_belongs_to_many :ingredients, :join_table => "ingredients_dishes"
  
end
