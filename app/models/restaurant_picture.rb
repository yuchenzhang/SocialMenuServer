class RestaurantPicture < ActiveRecord::Base
  has_attached_file :photo, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  validates_attachment :photo, :presence => true,    
    :size => { :in => 0..10.megabytes }
end
