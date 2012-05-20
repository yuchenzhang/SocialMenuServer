attributes :id, :name, :price, :description
child :reviews => :reviews  do
  extends "models/review"  
end