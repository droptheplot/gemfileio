FactoryGirl.define do
  factory :user do
    name { Faker::Lorem.word }
    provider 'github'
    uid { Faker::Number.number(32) }

    trait :admin do
      admin true
    end
  end
end
