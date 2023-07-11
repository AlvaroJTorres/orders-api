FactoryBot.define do
  factory :user do
    name { 'Tester 1' }
    sequence(:email) { |n| "Test#{n}@mail.com" }
  end
end
