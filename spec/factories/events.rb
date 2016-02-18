FactoryGirl.define do
  factory :event do
    name "event"
    association :registered_application
  end
end
