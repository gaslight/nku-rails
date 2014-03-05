FactoryGirl.define do
  factory :assignment do
    sequence(:name) { |n| "Assignment"}
    score 5
    total 10
  end
end
