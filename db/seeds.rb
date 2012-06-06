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
dishes = [
  ['Cucumber', 5.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'images/dish/cucumber.jpg'],
  ['Saliva Chicken', 5.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'images/dish/saliva_chicken.jpg'],
  ['Sliced Beef Omasum', 6.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'images/dish/sliced_beef_omasum.jpg'],
  ['Sashimi',6.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'images/dish/sashimi.jpg'],
  ['Tapas', 6.50, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .', 'images/dish/tapas.jpg'],
  ['Olive', 1, 'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .','images/dish/olive.jpg'],
  ['Lamb',11,"Petite lamb rib chops, with their pearly white \"handles,\" are cut from the ribs just behind the shoulders along the spine. ",'images/dish/lamb.jpg'],
  ['Oyster',7.5,'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .','images/dish/oyster.jpg'],
  ['Steak',20,'Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .','images/dish/steak.jpg'],
  ['Unagi',11,"Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. . ",'images/dish/unagi.jpg'],
  ['Eggwhite on Asparagus', 12, "Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .", 'images/dish/eggwhite_on_asparagus.jpg'],
  ['Sichuan Food', 16, "Lorem ipsum dolor sit amet, iudicabit intellegebat sea at, sea minim elitr ad, pri ne eligendi adversarium conclusionemque. .", 'images/dish/sichuan_food.jpg']
  
]

soho_eindhoven = Restaurant.create(:name => "soho Eindhoven", 
  :uuid => 'demo', 
  :latitude => 51.436126, :longitude => 5.488164, 
  :city_id => eindhoven.id,
  :address_line_1 => "Foodiesstraat 1",
  :address_line_2 => "1234 AA")                                           
1.upto(11) do |i|
  soho_eindhoven.tables.create!(:number => i,:uuid => UUID.new.generate)
end
dishes.each do |d|
  soho_eindhoven.dishes.create!(:name => d[0],:price => d[1], :description => d[2][0..139])
  soho_eindhoven.dishes.last.reviews.create!(:user => User.all.sample, :picture => (File.open(File.join Rails.root, d[3])), :comment => d[2][0..139].reverse)
end