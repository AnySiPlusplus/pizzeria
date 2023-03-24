class OrderItemDecorator < ApplicationDecorator
  delegate_all

  decorates_association :pizza

  delegate :first_image, to: :pizza

  def price
    pizza.price * quantity
  end

  def amount_pay
    price + object.pizza.fillings.where(type: 'AdditionalFilling').sum(&:price)
  end
end
