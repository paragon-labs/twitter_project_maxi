FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user#{n}@test.test" }
    password               'password'
    password_confirmation  'password'
    admin                  false

    factory :admin do
      admin true
    end

  end

end
