class OrdersController < ApplicationController
  before_action :set_user, only: %i[create]
  before_action :set_order, only: %i[update destroy]

  def index
    orders = Orders::IndexService.call(query_params)
    render json: { data: orders }
  end

  def show
    order = Orders::FinderService.call(params[:id])
    render json: { data: order }
  end
  
  def create
    order = Orders::CreatorService.call(order_params, @user)
    render json: { data: order }, status: :created
  end

  def update
    order = Orders::UpdaterService.call(order_params, @order)
    render json: { data: order }
  end

  def destroy
    Orders::DestroyService.call(@order)
    render body: nil, status: :no_content
  end

  private

  def order_params
    params.require(:order).permit(:amount, :payment_status, :order_status)
  end

  def query_params
    params.slice(:date)
  end

  def set_user
    raise CustomError.new(nil, 'Order not found', 404, nil) unless @user = User.find_by(id: params[:user_id])
  end

  def set_order
    raise CustomError.new(nil, 'Order not found', 404, nil) unless @order = Order.find_by(id: params[:id])
  end
end
