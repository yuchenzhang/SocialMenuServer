FactoryGirl.define do
  factory :user do
    name 'jack'
    email 'jack@socialmenu.fm'
    password 'password'
    password_confirmation 'password'
    avatar File.open(File.join(Rails.root, 'images/avatar/jack.png'))
    
    after_build{|u| u.ensure_authentication_token!}
  end
end