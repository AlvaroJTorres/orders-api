module Orders
  class IndexService < ApplicationService
    def initialize(params)
      super()
      @params = params
    end

    def call
      OrderRepresenter.for_collection.new(orders_scope)
    end

    private

    def orders_scope
      OrdersQuery.new.filter_by_delivered_date(@params[:date])
    end
  end
end
