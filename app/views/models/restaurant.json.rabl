attributes :id, :name, :latitude, :longitude, :address_line_1, :address_line_2
node :city do |r| r.city.name end 
child :pictures do
  attribute :url
end
child :dishes => :dishes do
  extends "models/dish"
end