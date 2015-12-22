FactoryGirl.define do
  factory :project do
    name { Faker::Lorem.word }
    owner { Faker::Lorem.word }
    repo { Faker::Lorem.word }
    active true
    category
  end
end
