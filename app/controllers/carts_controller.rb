class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items.includes(pizza: %i[pizza_pictures pizza_dimension fillings]).decorate.sort_by(&:id)
    @order = current_order.decorate
  end
end
