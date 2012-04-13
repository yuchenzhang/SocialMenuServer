class Restaurant < ActiveRecord::Base
  belongs_to :city
  has_many :tables
  has_many :dishes
  has_many :pictures, :class_name => "RestaurantPicture"
  
  validates_uniqueness_of :uuid, :on => :create, :message => "has already been taken"
  
  def add_picture_from_file(file)
    pictures.create!(:photo => file)
  end
  
  def to_json(options = nil)
    super(:except => [:id, :created_at, :updated_at,:uuid, :city_id], :include => {:city => {:only => :name}, :dishes => {:only => [:name, :price, :description]} })
  end
end
