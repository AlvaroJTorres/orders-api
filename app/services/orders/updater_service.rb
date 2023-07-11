module Orders
  class UpdaterService < ApplicationService
    def initialize(params, order)
      super()
      @params = params
      @order = order
    end

    def call
      raise CustomError.new(nil, 'Enter either payment status or order status', nil, nil) unless @params[:payment_status].present? || @params[:order_status].present?
      @order.update(@params)
      @order.payment_date = DateTime.now if @order.paid? && @order.payment_date.nil?
      @order.delivery_date = DateTime.now if @order.delivered? && @order.delivery_date.nil?
      @order.save

      OrderRepresenter.new(@order)
    end
  end
end