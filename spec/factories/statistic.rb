FactoryGirl.define do
  factory :statistic do
    active_projects_count { Faker::Number.number(2) }
    inactive_projects_count { Faker::Number.number(2) }
  end
end
