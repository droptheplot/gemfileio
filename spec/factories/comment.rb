FactoryGirl.define do
  factory :comment do
    body { Faker::Lorem.word }
    user
    project
  end
end
