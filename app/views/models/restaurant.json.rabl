attributes :name, :latitude, :longitude, :address_line_1, :address_line_2
child :city do
  attribute :name
end
child :pictures do
  attribute :url
end
child :dishes do
  attributes :name, :description, :price
  child :pictures do
    attribute :url
  end
end