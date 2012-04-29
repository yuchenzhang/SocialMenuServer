attributes :id, :status
child :user => :host do
  attributes :id, :name
end
child :restaurant do
  attributes :id, :name
end
child :dishes do
  extends 'models/dish'
end