class Dish < ActiveRecord::Base
  belongs_to :restaurant                          
  has_many :reviews, :order => "created_at desc"
  has_and_belongs_to_many :ingredients, :join_table => "ingredients_dishes"
  
end
