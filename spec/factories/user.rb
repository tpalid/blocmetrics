require 'faker'

FactoryGirl.define do
    factory :user do
        name { Faker::Name.name }
        email { Faker::Internet.email }
        password "helloworld"
        password_confirmation "helloworld"
        
        factory :invalid_user do
            name nil
        end
        
        factory :user_with_registered_applications do
            after(:create) do |user|
                2.times do
                    create(:registered_application, user: user)
                end
            end
        end
    end
end