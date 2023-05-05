module CustomPizzasHelper
  def current_dimension(order_item, dimension)
    return 'selected' if order_item.pizza.pizza_dimension == dimension
  end
end
