FactoryGirl.define do
  factory :project do
    sequence(:name) { |n| Faker::Lorem.word + n.to_s }
    owner { Faker::Lorem.word }
    repo { Faker::Lorem.word }
    active true
    category

    trait :with_comments do
      after :create do |project|
        create_list :comment, 5, project: project
      end
    end
  end
end
