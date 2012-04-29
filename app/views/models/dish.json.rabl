attributes :name, :description, :price, :id
child :pictures => :pictures do
  attribute :url
end