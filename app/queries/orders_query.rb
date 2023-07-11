class OrdersQuery
  attr_reader :relation

  def initialize(relation = Order.all)
    @relation = relation
  end

  def filter_by_delivered_date(date)
    return relation unless date.present?

    relation.where("delivery_date = ?", date.to_date)
  end
end
