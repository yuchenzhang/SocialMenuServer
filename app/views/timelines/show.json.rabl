# node :reviews do
#   @reviews.each do |re|
#     object re
#     extends 'models/review'
#   end
# end
collection @reviews => 'reviews'
extends 'models/review'