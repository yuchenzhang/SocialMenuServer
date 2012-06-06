class RestaurantPicture < ActiveRecord::Base
  has_attached_file :picture, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  validates_attachment :picture, :presence => true, :size => { :in => 0..10.megabytes }
  belongs_to :restaurant
  validates :restaurant, :presence => true
end
