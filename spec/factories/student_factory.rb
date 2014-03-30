FactoryGirl.define do
  factory :student do
    sequence(:name) {|n| "Student Name #{n}"}
    sequence(:email) {|n| "test-#{n}@example.com"}
    password "password"
    password_confirmation "password"

    factory :admin do
      admin true
    end
  end
end
