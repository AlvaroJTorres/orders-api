FactoryBot.define do
  factory :order do
    amount { 1000 }
    payment_status { 0 }
    order_status { 0 }
    association :user
  end
end