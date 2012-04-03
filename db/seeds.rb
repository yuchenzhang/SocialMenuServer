# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first) 

eindhoven,rotterdam,amsterdam,utrecht,denhaag = City.create([{ name: 'Eindhoven' }, { name: 'Rotterdam' }, {name: 'Amsterdam'},{name: 'Utrecht'}, {name: 'Den Haag'}])
dishes = [
  ['Thai Chicken', 5.50, 'Kipfilet met groeten en thaise curry - cocossaus'],
  ['Kon Bon Chicken', 5.50, 'Kipfilet met verse kruiden en cashewnoot in licht prikante saus'],
  ['King Doo Chicken',5.50, 'Kipfilet in een zoetzure saus met ananas'],
  ['Thai Beef', 6.50, 'Heerlijke biefstuk met thaise curry - cocossaus'],
  ['Tokyo Beef',6.50, 'Biefstuk in Japanse sojasaus'],
  ['Garlic Seafood', 6.00, 'Mix van zeevruchten, groenten in verse knoflooksaus'],
  ['Tropical Prawn', 6.50, 'Garnalen met ananas, tomaten, uien in fruitige zoetezuresaus'],
  ['Tjap Tjoy', 4.50, 'Mix van seizongroenten']
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
dishes.each do |d|
  soho_eindhoven.dishes.create!(:name => d[0],:price => d[1], :description => d[2])
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
dishes.each do |d|
  soho_utrecht.dishes.create!(:name => d[0],:price => d[1], :description => d[2])
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
dishes.each do |d|
  soho_rotterdam.dishes.create!(:name => d[0],:price => d[1], :description => d[2])
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
dishes.each do |d|
  soho_amsterdam.dishes.create!(:name => d[0],:price => d[1], :description => d[2])
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
dishes.each do |d|
  soho_denhaag.dishes.create!(:name => d[0],:price => d[1], :description => d[2])
end