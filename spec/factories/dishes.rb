# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :dish do
    name "MyString"
    restaurant_id 1
    description "MyText"
    price 1.5
  end
end
