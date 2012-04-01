# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first) 

eindhoven,rotterdam,amsterdam,utrecht,denhaag = City.create([{ name: 'Eindhoven' }, { name: 'Rotterdam' }, {name: 'Amsterdam'},{name: 'Utrecht'}, {name: 'Den Haag'}])
Restaurant.create(:name => "soho Eindhoven", 
:uuid => UUID.new.generate, 
:latitude => 51.436126, :longitude => 5.488164, 
:city_id => eindhoven.id,
:address_line_1 => "Foodiesstraat 1",
:address_line_2 => "1234 AA")
Restaurant.create(:name => "soho Utrecht",
:uuid => UUID.new.generate,
:latitude => 52.07613, :longitude => 5.103149,
:city_id => utrecht.id,
:address_line_1 => "Foodiesstraat 1",
:address_line_2 => "1234 AA")
Restaurant.create(:name => "soho Rotterdam",
:uuid => UUID.new.generate,
:latitude => 51.917168, :longitude => 4.493408,
:city_id => rotterdam.id,
:address_line_1 => "Foodiesstraat 1",
:address_line_2 => "1234 AA")
Restaurant.create(:name => "soho Amsterdam",
:uuid => UUID.new.generate,
:latitude => 52.352119, :longitude => 4.894409,
:city_id => amsterdam.id,
:address_line_1 => "Foodiesstraat 1",
:address_line_2 => "1234 AA")
Restaurant.create(:name => "soho Den Haag",
:uuid => UUID.new.generate,
:latitude => 52.062623, :longitude => 4.312134,
:city_id => denhaag.id,
:address_line_1 => "Foodiesstraat 1",
:address_line_2 => "1234 AA")