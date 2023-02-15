class PizzaDimensionDecorator < ApplicationDecorator
  delegate_all

  def name
    object.dimension
  end
end
