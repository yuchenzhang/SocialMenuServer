# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dish do
    name "Roasted Duck"
    association :restaurant, :factory => :restaurant
    description "The roast duck is crispy in skin and tender in meat."
    price 13.5
  end
end
