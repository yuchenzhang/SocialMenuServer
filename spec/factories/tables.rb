# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :table do
    association :restaurant, :factory => :restaurant
    uuid UUID.new.generate
    sequence(:number)
  end
end
