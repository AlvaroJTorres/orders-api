class Order < ApplicationRecord
  belongs_to :user

  enum payment_status: %i(payment_pending paid unpaid)
  enum order_status: %i(received in_preparation in_route delivered)

  validates :amount, presence: true, numericality: true
end
