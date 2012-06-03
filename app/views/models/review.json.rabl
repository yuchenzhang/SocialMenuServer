attribute :id, :comment
node :picture do |re| re.picture.url(:medium) end 
child :user do
  extends "models/user"
end
child :dish => 'dish' do
  attributes :id, :name, :price, :description
end