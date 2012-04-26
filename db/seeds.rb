# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first) 

%w(jack rose laura steve).each do |user|
  User.create!(
    :name => user,
    :email => "#{user}@socialmenu.fm",
    :password => 'password',
    :password_confirmation => 'password',
    :avatar => File.open(File.join(Rails.root, "tmp/avatars/#{user}.png"))
  ).ensure_authentication_token!
end


eindhoven,rotterdam,amsterdam,utrecht,denhaag = City.create([{ name: 'Eindhoven' }, { name: 'Rotterdam' }, {name: 'Amsterdam'},{name: 'Utrecht'}, {name: 'Den Haag'}])
takeawaydishes = [
  ['Cucumber', 5.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'tmp/cucumber.jpg'],
  ['Saliva Chicken', 5.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'tmp/saliva_chicken.jpg'],
  ['Steamed Dumpling',5.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'tmp/steamed_dumpling.jpg'],
  ['Sliced Beef Omasum', 6.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'tmp/sliced_beef_omasum.jpg'],
  ['Sashimi',6.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'tmp/sashimi.jpg'],
  ['Tum Yum Soup', 6.00, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'tmp/tumyum_soup.jpg'],
  ['Tapas', 6.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'tmp/tapas.jpg'],
  ['Olive', 1, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .','tmp/olive.jpg'],
  ['Hotpot',10, "less commonly Chinese fondue or steamboat, refers to several East Asian varieties of stew, consisting of a simmering metal pot of stock at the center of the dining table. While the hot pot is kept simmering, ingredients are placed into the pot and are cooked at the table. Typical hot pot dishes include thinly sliced meat, leafy vegetables, mushrooms, wontons, egg dumplings, and seafood. Vegetables, fish and meat should be fresh. The cooked food is usually eaten with a dipping sauce.",'tmp/hotpot.jpg'],
  ['Lamb',11,"Petite lamb rib chops, with their pearly white \"handles,\" are cut from the ribs just behind the shoulders along the spine. Each rack of ribs, on either side of the spine, will contain seven or eight ribs.The meat is very tender, which makes rib chops perfect for quick, high-heat cooking methods, like searing, roasting or grilling.",'tmp/lamb.jpg'],
  ['Lamb Steak',12,"Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .",'tmp/lamb_steak.jpg'],
  ['Oyster',7.5,'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .','tmp/oyster.jpg'],
  ['Paella',8,'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .','tmp/paella.jpg'],
  ['Steak',20,'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .','tmp/steak.jpg'],
  ['Unagi',11,"Grilled unagi is a relatively expensive delicacy in Japan, prized not only for its flavor but also for its legendary stamina-giving properties. It's traditionally eaten during the hottest part of the summer (on the \"Day of the Ox\" on the lunar calendar) to provide strength and vitality for the rest of the year.",'tmp/unagi.jpg']
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