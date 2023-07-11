module Orders
  class FinderService < ApplicationService
    def initialize(id)
      super()
      @id = id
    end

    def call
      raise CustomError.new(nil, 'Order not found', 404, nil) unless order = Order.find_by(id: @id)

      OrderRepresenter.new(order)
    end
  end
end