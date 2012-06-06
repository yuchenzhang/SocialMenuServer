FactoryGirl.define do
  factory :review do
    association :user, :factory => :user
    association :dish, :factory => :dish
    comment "blabla"
  end
end
