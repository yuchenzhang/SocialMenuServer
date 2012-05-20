attribute :id, :comment
node :picture do |re| re.picture.url(:medium) end 
child :user do
  extends "models/user"
end