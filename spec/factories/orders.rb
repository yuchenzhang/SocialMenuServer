FactoryGirl.define do
  factory :order do
    association :user, :factory => :user
    association :restaurant, :factory => :restaurant
  end
end