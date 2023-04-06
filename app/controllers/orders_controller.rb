class OrdersController < ApplicationController
  def index
    @orders = Orders::OrdersQuery.new(params, current_user).call.decorate
  end

  def show
    @order = Order.find(params[:id]).decorate
    @order_items = @order.order_items.includes(pizza: :pizza_pictures)
    @shipping_address = @order.shipping_address
  end
end
