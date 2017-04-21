FactoryGirl.define do

  factory :favorite do
    association :user
    association :tweet
  end

end
