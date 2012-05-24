attributes :id, :status
child :user do
  extends "models/user"
end
child :restaurant do
  extends "models/restaurant"
end
child :dishes => :dishes do
  extends 'models/dish'
end