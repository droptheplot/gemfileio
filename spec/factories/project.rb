FactoryGirl.define do
  factory :project do
    name { Faker::Lorem.word }
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
