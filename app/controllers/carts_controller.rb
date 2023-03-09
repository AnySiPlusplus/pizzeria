class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items.includes(pizza: :pizza_pictures).decorate.sort_by(&:id)
    @order = current_order.decorate
  end
end
