class DishPicture < ActiveRecord::Base
  has_attached_file :photo, :styles => {:medium => "480x480>", :thumb => "100x100>"}
  validates_attachment :photo, :presence => true,
    :size => { :in => 0..10.megabytes }
  belongs_to :dish
  validates_presence_of :dish_id, :on => :create, :message => "can't be blank" 
  
  def url
    photo.url(:medium)
  end
end
