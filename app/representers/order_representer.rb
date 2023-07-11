class OrderRepresenter < Representable::Decorator
  include Representable::JSON

  property :id
  property :amount
  property :payment_status
  property :order_status
  property :payment_date
  property :delivery_date
  property :user_info, exec_context: :decorator

  def user_info
    represented.user.name
  end
end