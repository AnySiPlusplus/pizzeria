class OrderDecorator < ApplicationDecorator
  delegate_all
  decorates_association :order_items

  def amount_pay
    order_items.includes(:pizza).sum(&:price)
  end
end
