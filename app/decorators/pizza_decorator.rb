class PizzaDecorator < ApplicationDecorator
  SHORT_DESCRIPTION = 100
  delegate_all

  def short_description
    object.description.truncate(SHORT_DESCRIPTION)
  end

  def pizza_dimension
    object.pizza_dimension.dimension
  end
end
