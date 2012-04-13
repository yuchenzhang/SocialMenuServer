# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first) 

eindhoven,rotterdam,amsterdam,utrecht,denhaag = City.create([{ name: 'Eindhoven' }, { name: 'Rotterdam' }, {name: 'Amsterdam'},{name: 'Utrecht'}, {name: 'Den Haag'}])
takeawaydishes = [
  ['Banh Mi', 5.50, 'Vietnamese baguette filled with meat and soy', 'tmp/banhmi.jpg'],
  ['Saliva Chicken', 5.50, 'Sliced chicken topped with garlic and spicy sauce', 'tmp/saliva_chicken.jpg'],
  ['Steamed Dumpling',5.50, 'Kipfilet in een zoetzure saus met ananas', 'tmp/steamed_dumpling.jpg'],
  ['Sliced Beef Omasum', 6.50, 'Sliced beef omasum', 'tmp/sliced_beef_omasum.jpg'],
  ['Sashimi',6.50, 'Raw salmon wrap served with wasabi', 'tmp/sashimi.jpg'],
  ['Tum Yum Soup', 6.00, 'Spicy Thai soup with muschroom, shrimp and various vegetables', 'tmp/tumyum_soup.jpg'],
  ['Tapas', 6.50, 'Spanish seafood tapas', 'tmp/tapas.jpg']
]

soho_eindhoven = Restaurant.create(:name => "soho Eindhoven", 
:uuid => UUID.new.generate, 
:latitude => 51.436126, :longitude => 5.488164, 
:city_id => eindhoven.id,
:address_line_1 => "Foodiesstraat 1",
:address_line_2 => "1234 AA")                                           
1.upto(11) do |i|
  soho_eindhoven.tables.create!(:number => i,:uuid => UUID.new.generate)
end
takeawaydishes.each do |d|
  dish = Dish::Takeawaydish.create!(:name => d[0],:price => d[1], :description => d[2])
  dish.add_picture_from_file File.open(File.join Rails.root, d[3])
  soho_eindhoven.dishes << dish
end
soho_utrecht = Restaurant.create(:name => "soho Utrecht",
:uuid => UUID.new.generate,
:latitude => 52.07613, :longitude => 5.103149,
:city_id => utrecht.id,
:address_line_1 => "Foodiesstraat 1",
:address_line_2 => "1234 AA")
1.upto(11) do |i|
  soho_utrecht.tables.create!(:number => i,:uuid => UUID.new.generate)
end
takeawaydishes.each do |d|
  dish = Dish::Takeawaydish.create!(:name => d[0],:price => d[1], :description => d[2])
  dish.add_picture_from_file File.open(File.join Rails.root, d[3])
  soho_utrecht.dishes << dish
end
soho_rotterdam = Restaurant.create(:name => "soho Rotterdam",
:uuid => UUID.new.generate,
:latitude => 51.917168, :longitude => 4.493408,
:city_id => rotterdam.id,
:address_line_1 => "Foodiesstraat 1",
:address_line_2 => "1234 AA")
1.upto(11) do |i|
  soho_rotterdam.tables.create!(:number => i,:uuid => UUID.new.generate)
end
takeawaydishes.each do |d|
  dish = Dish::Takeawaydish.create!(:name => d[0],:price => d[1], :description => d[2])
  dish.add_picture_from_file File.open(File.join Rails.root, d[3])
  soho_rotterdam.dishes << dish
end
soho_amsterdam = Restaurant.create(:name => "soho Amsterdam",
:uuid => UUID.new.generate,
:latitude => 52.352119, :longitude => 4.894409,
:city_id => amsterdam.id,
:address_line_1 => "Foodiesstraat 1",
:address_line_2 => "1234 AA")
1.upto(11) do |i|
  soho_amsterdam.tables.create!(:number => i,:uuid => UUID.new.generate)
end
takeawaydishes.each do |d|
  dish = Dish::Takeawaydish.create!(:name => d[0],:price => d[1], :description => d[2])
  dish.add_picture_from_file File.open(File.join Rails.root, d[3])
  soho_amsterdam.dishes << dish
end
soho_denhaag = Restaurant.create(:name => "soho Den Haag",
:uuid => UUID.new.generate,
:latitude => 52.062623, :longitude => 4.312134,
:city_id => denhaag.id,
:address_line_1 => "Foodiesstraat 1",
:address_line_2 => "1234 AA")
1.upto(11) do |i|
  soho_denhaag.tables.create!(:number => i,:uuid => UUID.new.generate)
end
takeawaydishes.each do |d|
  dish = Dish::Takeawaydish.create!(:name => d[0],:price => d[1], :description => d[2])
  dish.add_picture_from_file File.open(File.join Rails.root, d[3])
  soho_denhaag.dishes << dish
end