FactoryGirl.define do
  factory :restaurant do
    name "soho Eindhoven"
    uuid UUID.new.generate
    latitude 51.9171680000 
    longitude 4.4934080000 
    association :city, :factory => :city, :name => "Eindhoven"
    address_line_1 "Foodiesstraat 1"
    address_line_2 "1234 AA"
  end
end