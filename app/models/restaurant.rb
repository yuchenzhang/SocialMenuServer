class Restaurant < ActiveRecord::Base
  belongs_to :city
  has_many :tables
  has_many :dishes
  has_many :pictures, :class_name => "RestaurantPicture"
  has_many :orders
  
  validates_uniqueness_of :uuid, :on => :create, :message => "has already been taken"
  
  def add_picture_from_file(file)
    pictures.create!(:photo => file)
  end
end
