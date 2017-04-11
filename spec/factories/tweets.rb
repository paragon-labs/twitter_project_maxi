FactoryGirl.define do

  factory :tweet do
    sequence(:number) { |n| n }
    text 'MyText'

    factory :tweet_with_users do
      after(:create) do |tweet|
        create_list(:users, 2, faved_tweet: [tweet])
      end
    end

  end

  factory :faved_tweet, class: Tweet do
    sequence(:number) { |n| n }
    text 'This is a faved tweet'
    user
  end

end
