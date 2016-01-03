FactoryGirl.define do
  factory :category do
    sequence(:title) { |n| Faker::Lorem.word + n.to_s }
  end
end
