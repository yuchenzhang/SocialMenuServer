class RestaurantPicture < ActiveRecord::Base
  has_attached_file :photo, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  validates_attachment :photo, :presence => true,    
    :size => { :in => 0..10.megabytes }
  belongs_to :restaurant
  validates_presence_of :restaurant_id, :on => :create, :message => "can't be blank"
end
