attributes :name, :price, :id
child :pictures => :pictures do
  attribute :url
end