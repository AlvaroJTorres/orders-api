class OrderForm < Reform::Form
  property :amount
  property :payment_status
  property :order_status

  validates :amount, presence: true, on: :create
  validate :numericality

  def numericality
    return unless amount

    errors.add(:amount, :amount, message: 'Amount must be a number') unless amount.is_a? Integer
  end
end
