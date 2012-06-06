class Dish < ActiveRecord::Base
  belongs_to :restaurant                          
  has_many :reviews, :order => "created_at desc"
  validates :restaurant, :presence => true
  validates :name, :presence => true
  validates :price, :presence => true
  validates :description, :presence => true                           
end
