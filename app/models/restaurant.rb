class Restaurant < ActiveRecord::Base
  belongs_to :city
  has_many :tables
  has_many :dishes
  validates_uniqueness_of :uuid, :on => :create, :message => "has already been taken"
  def to_json(options = nil)
    super(:except => [:id, :created_at, :updated_at,:uuid, :city_id], :include => {:city => {:only => :name}, :dishes => {:only => [:name, :price, :description]} })
  end
end
