FactoryGirl.define do
  factory :registered_application do
    name Faker::Lorem.word
    url Faker::Internet.url
    association :user
      factory :invalid_registered_application do
        name nil
      end
  end
end
