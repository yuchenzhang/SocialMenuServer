class Review < ActiveRecord::Base
  belongs_to :dish
  belongs_to :user
  belongs_to :order
  validates :dish, :presence => true
  validates :comment, :length => {:maximum => 140}
  
  has_attached_file :picture, :styles => {:medium => "300x300>", :thumb => "100x100>"}
  validates_attachment :picture, :size => { :in => 0..10.megabytes }
end
