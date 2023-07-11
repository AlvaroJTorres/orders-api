module Orders
  class DestroyService < ApplicationService
    def initialize(order)
      super()
      @order = order
    end

    def call
      @order.destroy
    end
  end
end