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
    :avatar => File.open(File.join(Rails.root, "images/avatar/#{user}.png"))
  ).ensure_authentication_token!
end


eindhoven,rotterdam,amsterdam,utrecht,denhaag = City.create([{ name: 'Eindhoven' }, { name: 'Rotterdam' }, {name: 'Amsterdam'},{name: 'Utrecht'}, {name: 'Den Haag'}])
takeawaydishes = [
  ['Cucumber', 5.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'images/dish/cucumber.jpg'],
  ['Saliva Chicken', 5.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'images/dish/saliva_chicken.jpg'],
  ['Sliced Beef Omasum', 6.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'images/dish/sliced_beef_omasum.jpg'],
  ['Sashimi',6.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'images/dish/sashimi.jpg'],
  ['Tapas', 6.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'images/dish/tapas.jpg'],
  ['Olive', 1, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .','images/dish/olive.jpg'],
  ['Lamb',11,"Petite lamb rib chops, with their pearly white \"handles,\" are cut from the ribs just behind the shoulders along the spine. ",'images/dish/lamb.jpg'],
  ['Oyster',7.5,'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .','images/dish/oyster.jpg'],
  ['Steak',20,'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .','images/dish/steak.jpg'],
  ['Unagi',11,"Grilled unagi is a relatively expensive delicacy in Japan, prized not only for its flavor but also for its legendary stamina-giving properties. ",'images/dish/unagi.jpg'],
  ['Eggwhite on Asparagus', 12, "Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .", 'images/dish/eggwhite_on_asparagus.jpg'],
  ['Sichuan Food', 16, "Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .", 'images/dishes/sichuan_food.jpg']
  
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
  dish = Dish::Takeawaydish.create!(:name => d[0],:price => d[1], :description => d[2][0..139])
  dish.reviews.create!(:user => User.all.sample, :picture => (File.open(File.join Rails.root, d[3])), :comment => dish.description.reverse)
  soho_eindhoven.dishes << dish
end
# soho_utrecht = Restaurant.create(:name => "soho Utrecht",
# :uuid => UUID.new.generate,
# :latitude => 52.07613, :longitude => 5.103149,
# :city_id => utrecht.id,
# :address_line_1 => "Foodiesstraat 1",
# :address_line_2 => "1234 AA")
# 1.upto(11) do |i|
#   soho_utrecht.tables.create!(:number => i,:uuid => UUID.new.generate)
# end
# takeawaydishes.each do |d|
#   dish = Dish::Takeawaydish.create!(:name => d[0],:price => d[1], :description => d[2])
#   dish.add_picture_from_file File.open(File.join Rails.root, d[3])
#   soho_utrecht.dishes << dish
# end
# soho_rotterdam = Restaurant.create(:name => "soho Rotterdam",
# :uuid => UUID.new.generate,
# :latitude => 51.917168, :longitude => 4.493408,
# :city_id => rotterdam.id,
# :address_line_1 => "Foodiesstraat 1",
# :address_line_2 => "1234 AA")
# 1.upto(11) do |i|
#   soho_rotterdam.tables.create!(:number => i,:uuid => UUID.new.generate)
# end
# takeawaydishes.each do |d|
#   dish = Dish::Takeawaydish.create!(:name => d[0],:price => d[1], :description => d[2])
#   dish.add_picture_from_file File.open(File.join Rails.root, d[3])
#   soho_rotterdam.dishes << dish
# end
# soho_amsterdam = Restaurant.create(:name => "soho Amsterdam",
# :uuid => UUID.new.generate,
# :latitude => 52.352119, :longitude => 4.894409,
# :city_id => amsterdam.id,
# :address_line_1 => "Foodiesstraat 1",
# :address_line_2 => "1234 AA")
# 1.upto(11) do |i|
#   soho_amsterdam.tables.create!(:number => i,:uuid => UUID.new.generate)
# end
# takeawaydishes.each do |d|
#   dish = Dish::Takeawaydish.create!(:name => d[0],:price => d[1], :description => d[2])
#   dish.add_picture_from_file File.open(File.join Rails.root, d[3])
#   soho_amsterdam.dishes << dish
# end
# soho_denhaag = Restaurant.create(:name => "soho Den Haag",
# :uuid => UUID.new.generate,
# :latitude => 52.062623, :longitude => 4.312134,
# :city_id => denhaag.id,
# :address_line_1 => "Foodiesstraat 1",
# :address_line_2 => "1234 AA")
# 1.upto(11) do |i|
#   soho_denhaag.tables.create!(:number => i,:uuid => UUID.new.generate)
# end
# takeawaydishes.each do |d|
#   dish = Dish::Takeawaydish.create!(:name => d[0],:price => d[1], :description => d[2])
#   dish.add_picture_from_file File.open(File.join Rails.root, d[3])
#   soho_denhaag.dishes << dish
# end