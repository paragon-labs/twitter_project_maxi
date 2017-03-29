FactoryGirl.define do

  factory :user do |user|
    user.email                 "user@test.com"
    user.password               "password"
    user.password_confirmation  "password"
    user.admin                  false
  end

  factory :admin, class: User do |user|
    user.email                 "admin@test.com"
    user.password               "password"
    user.password_confirmation  "password"
    user.admin                  true
  end

end
