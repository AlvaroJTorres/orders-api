module Orders
  class CreatorService < ApplicationService
    def initialize(params, user)
      super()
      @params = params
      @user = user
    end

    def call
      form = OrderForm.new(Order.new)
      raise CustomError.new(nil, nil, nil, form.errors.messages) unless form.validate(@params)
      new_order = @user.orders.create(@params)

      OrderRepresenter.new(new_order)
    end
  end
end