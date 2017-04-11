FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user#{n}@test.test" }
    password               'password'
    password_confirmation  'password'
    admin                  false

    factory :admin do
      admin true
    end

    factory :user_with_tweets do
      after(:create) do |user|
        create_list(:tweet, 2, users: [user])
      end
    end

  end

end
