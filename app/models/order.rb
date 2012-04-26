class Order < ActiveRecord::Base 
  belongs_to :host, :class_name => "User"
  belongs_to :restaurant
  has_and_belongs_to_many :dishes
end
